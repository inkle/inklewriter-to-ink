import { ExecFileOptionsWithStringEncoding } from "child_process";
import { SIGUSR1 } from "constants";

interface choice {
    linkPath: string,
    ifConditions: ifCondition[] | null,
    option: string,
    notIfConditions: notIfCondition[] | null
}

interface notIfCondition {
    notIfCondition: string
}

interface ifCondition {
    ifCondition: string
}

interface pageNum {
    pageNum: number
}

interface pageLabel {
    pageLabel: string
}

interface stitchData {
    content: contentData[]
}

interface divert {
    divert: string
}

// Equivalent to ink glue
interface runOn {
    runOn: true
}

interface flag {
    flagName: string
}

interface image {
    image: string
}

type contentData = string | choice | notIfCondition | ifCondition | divert | runOn | flag | pageNum | pageLabel | image;



interface inklewriterData {
    allowCheckpoints : boolean,
    optionMirroring : boolean,
    initial : string,
    stitches : {
        [name:string]: stitchData
    },
    editorData: {
        playPoint: string,
        textSize: number,
        authorName: string,
        libraryVisible: boolean
    }
}

interface inklewriterJSON {
    title : string,
    data : inklewriterData,
    created_at: string, // date
    url_key: string,
    updated_at: string // date
}

class Condition {

    constructor(condition : string, isNot : boolean) {
        this.condition = condition;
        this.isNot = isNot;
    }

    condition : string
    isNot : boolean
}

class Stitch {
    constructor(name : string, data : stitchData, owner : Story) {
        this.name = name;

        this.textContent = [];
        this.choices = [];
        this.conditions = [];
        
        this.divert = null;
        this.runOn = false;
        this.flagNames = [];
        this.image = null;

        this.pageNum = -1;
        this.originalPageNum = -1;
        this.pageLabel = null;
        this.distanceFromHeader = -1;
        this.header = null;

        this.divertBackLinks = [];

        this.owner = owner;

        for(var c of data.content) {

            // Text content
            if( typeof(c) == "string" ) {
                this.textContent.push(c);
            }

            // Choice
            else if( (c as choice).option !== undefined ) {
                this.choices.push(c as choice);
            }

            // Page num
            else if( (c as pageNum).pageNum !== undefined ) {
                this.pageNum = this.originalPageNum = (c as pageNum).pageNum;
            }

            // Page label
            else if( (c as pageLabel).pageLabel !== undefined ) {
                this.pageLabel = (c as pageLabel).pageLabel;
            }

            // ifCondition
            else if( (c as ifCondition).ifCondition !== undefined ) {
                this.conditions.push(new Condition((c as ifCondition).ifCondition, false));
            }

            // notIfCondition
            else if( (c as notIfCondition).notIfCondition !== undefined ) {
                this.conditions.push(new Condition((c as notIfCondition).notIfCondition, true));
            }

            // divert
            else if( (c as divert).divert !== undefined ) {
                this.divert = (c as divert).divert;
            }

            // runOn
            else if( (c as runOn).runOn !== undefined ) {
                this.runOn = true;
            }

            // flag
            else if( (c as flag).flagName !== undefined ) {
                this.flagNames.push((c as flag).flagName);
            }

            // image
            else if( (c as image).image !== undefined ) {
                this.image = (c as image).image;
            }
        }
    }

    eachLinkedStitch(func : (s : Stitch) => void) {
        if( this.divert !== null ) {
            let divertTarget = this.owner.stitchesByName[this.divert];
            func(divertTarget);
        }

        for(let c of this.choices) {
            var choiceTarget = this.owner.stitchesByName[c.linkPath];
            func(choiceTarget);
        }
    }

    get isHeader() : boolean {
        return this.distanceFromHeader === 0;
    }

    get divertTarget() : Stitch | null {
        if( this.divert )
            return this.owner.stitchesByName[this.divert];
        else
            return null;
    }

    name : string;
    textContent : string[]
    choices : choice[]
    pageNum : number
    originalPageNum : number
    header : Stitch | null
    pageLabel : string | null
    distanceFromHeader : number
    conditions : Condition[]
    divert : string | null
    runOn : boolean
    flagNames : string[]
    image : string | null

    divertBackLinks : Stitch[]

    owner : Story
}

class Story {

    title : string
    author : string

    initialStitchName : string

    stitchesByName : { [name: string]: Stitch }
    orderedStitches : Stitch[];

    constructor(json : inklewriterJSON) {
        let data = json.data as inklewriterData;

        this.title = json.title;
        this.author = data.editorData.authorName;
        this.initialStitchName = data.initial;

        this.stitchesByName = {};
        this.orderedStitches = [];
        
        for(let stitchName in data.stitches) {
            let stitchData = data.stitches[stitchName];
            let stitch = new Stitch(stitchName, stitchData, this);

            this.stitchesByName[stitchName] = stitch;
            this.orderedStitches.push(stitch);
        }

        this.calculateSectionsAndOrdering();
    }

    get firstStitch() : Stitch {
        return this.stitchesByName[this.initialStitchName];
    }

    private calculateSectionsAndOrdering() {

        let originalHeaders : Stitch[] = [];

        function searchLinksForSortIndices(stitch : Stitch, originalHeader : Stitch, currentDepth : number) {
            
            // Explicitly numbered headers get treated specially in the main loop
            if( stitch.originalPageNum >= 0 )
                return;

            // Labelled pages are also headers, but we don't know their overall ordering ahead of time
            else if( stitch.pageLabel != null) {
                currentDepth = 0;
            }

            if( stitch.distanceFromHeader === -1 || currentDepth < stitch.distanceFromHeader ) {
                stitch.distanceFromHeader = currentDepth;

                // If this is a stitch with a valid pageLabel then strictly speaking it
                // shouldn't have the same page number as the originalHeader, but 
                stitch.pageNum = originalHeader.originalPageNum;

                // Recurse
                stitch.eachLinkedStitch(subStitch => searchLinksForSortIndices(subStitch, originalHeader, currentDepth + 1));
            }
        }

        // First stitch is implicitly a header stitch
        let first = this.firstStitch;

        originalHeaders = this.orderedStitches.filter(s => s.originalPageNum >= 0 || s === first);

        for(let originalHeader of originalHeaders) {
            originalHeader.distanceFromHeader = 0;
            originalHeader.eachLinkedStitch(subStitch => searchLinksForSortIndices(subStitch, originalHeader, 1));
        }

        let unreachedStitches : Stitch[] = [];

        // Drop unreached stitches down to the bottom
        for(let stitch of this.orderedStitches) {
            if( stitch.pageNum === -1 ) {
                stitch.pageNum = 1000000;
                unreachedStitches.push(stitch);
            }
        }

        if( unreachedStitches.length > 0 && !unreachedStitches[0].pageLabel ) {
            unreachedStitches[0].pageLabel = "##Unused##";
        }

        // Find the overall linear ordering of the stitches
        this.orderedStitches.sort((s1, s2) => {
            if( s1.pageNum != s2.pageNum )
                return s1.pageNum - s2.pageNum;
            else
                return s1.distanceFromHeader - s2.distanceFromHeader;
        });

        // Extract final ordered sections, and renumber
        let header : Stitch | null = null;
        let pageNum = 0;
        for(let stitch of this.orderedStitches) {

            // Either it's an original header or it's a labelled header
            // that needs its own page number now.
            // Or it's the unused page we may have created above
            if( stitch.distanceFromHeader === 0 || stitch.pageLabel === "##Unused##" ) {
                header = stitch;
                pageNum++;
            }

            stitch.header = header;
            stitch.pageNum = pageNum;
        }


        // Set up backlinks
        for(let stitch of this.orderedStitches) {
            var target = stitch.divertTarget;
            if( target )
                target.divertBackLinks.push(stitch);
        }
    }
}

function createIdentifierFromString(str : string, collisionDictionary : {[existingName:string]:any}) : string {
    let id = "";
    for(let c of str) {
        // Allow a-z etc
        if( c >= '0' && c <= '9' || c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c == '_' ) {
            id += c;
        } 

        // Convert whitespace to single '_'
        else if( c == ' ' || c == '\t' ) {
            if( id.length > 0 && id[id.length-1] != "_" )
                id += "_";
        }
        
        // skip everything else
    }

    if( id.length > 0 && id[id.length-1] == "_" ) {
        id = id.substr(0, id.length-1);
    }

    // Avoid naming collisions
    let originalId = id;
    let count = 2;
    while(collisionDictionary[id]) {
        id = `${originalId}_${count}`;
        count++;
    }

    return id;
}

interface flagDeclaration {
    flagName : string
    simpleDecl : true
}

interface flagAssignment {
    flagName : string
    assign : true
    value : number | boolean
}

interface flagMathOp {
    flagName : string
    mathOp : true
    op : string
    value : number
}

type parsedFlag = flagDeclaration | flagAssignment | flagMathOp;

function parseFlag(flagText : string) : parsedFlag {
    let result : any = {}

    // Assignment
    var assignPos = flagText.indexOf("=");
    if( assignPos !== -1 ) {
        result.flagName = flagText.substr(0, assignPos).trim(); 
        result.assign = true;
        let valueTxt = flagText.substr(assignPos+1).trim();
        if( valueTxt === "true" )
            result.value = true
        else if( valueTxt === "false" )
            result.value = false;
        else {
            result.value = parseInt(valueTxt);
        }
    }

    // Inc/dec
    var mathOpPos = flagText.search(/(\+|-|\*|\/)/);
    if( !result.assign && mathOpPos !== -1 ) {
        let op = flagText[mathOpPos];
        result.flagName = flagText.substr(0, mathOpPos).trim(); 
        result.flagName = flagText.substr(0, mathOpPos).trim(); 
        let valueTxt = flagText.substr(assignPos+1).trim();
        result.op = op;
        result.value = parseInt(valueTxt);
        result.mathOp = true;
    }

    // Simple flag decl
    if( !result.assign && !result.mathOp ) {
        result.simpleDecl = true;
        result.flagName = flagText.trim();
    }

    return result;
}

let inkLines : string[];

export function convert(sourceJSON : inklewriterJSON) : string {
    
    var story = new Story(sourceJSON);

    inkLines = [];

    // Create ink-specific stitch/knot name mappings out of the inklewriter content
    let inklewriterStitchToInkNames : { [inklewriterName:string]: string} = {};
    for(let stitch of story.orderedStitches) {

        let inkName = stitch.name;

        if( stitch.isHeader && stitch.pageLabel )
            inkName = createIdentifierFromString(stitch.pageLabel, inklewriterStitchToInkNames);

        inklewriterStitchToInkNames[stitch.name] = inkName;
    }

    let initialKnotName = inklewriterStitchToInkNames[story.initialStitchName];

    inkLines.push(`// ---- ${sourceJSON.title} ----`);
    inkLines.push(`// Converted from original URL:`);
    inkLines.push(`// http://writer.inklestudios.com/stories/${sourceJSON.url_key}`);
    inkLines.push(`# title: ${story.title}`);
    inkLines.push(`# author: ${story.author}`);
    inkLines.push(`// -----------------------------`);
    inkLines.push(``);

    // Flag names can have spaces, so we need to cover them all to proper identifiers
    let flagNamesToVarNames : { [flagName:string]: string } = {};
    let varNamesToFlagNames : { [varName:string]: string } = {};
    let orderedVarNames : string[] = [];
    let assumedDefaultByVarName : { [varName:string]: any } = {};
    for(let s of story.orderedStitches) {
        for(let flag of s.flagNames) {
            
            // Flag patterns:
            //   - simple text
            //   - flag name = 5
            //   - flag name - 1
            //   - flag name + 1
            //   - flag name = false
            let flagResult = parseFlag(flag);

            let varName = flagNamesToVarNames[flagResult.flagName];
            if( !varName ) {
                varName = createIdentifierFromString(flagResult.flagName, varNamesToFlagNames);
                flagNamesToVarNames[flagResult.flagName] = varName;
                varNamesToFlagNames[varName] = flagResult.flagName;
                orderedVarNames.push(varName);
            }

            let flagAssign = (flagResult as flagAssignment);
            if( flagAssign.assign ) {
                let currentDefault = assumedDefaultByVarName[varName];
                if( currentDefault === undefined ) {
                    if( typeof flagAssign.value === "number" ) {
                        assumedDefaultByVarName[varName] = 0;
                    } else if( typeof flagAssign.value === "boolean" ) {
                        assumedDefaultByVarName[varName] = false;
                    }
                }
            }

            let flagMathOp = (flagResult as flagMathOp);
            if( flagMathOp.mathOp ) {
                let currentDefault = assumedDefaultByVarName[varName];
                if( currentDefault === undefined ) {
                    assumedDefaultByVarName[varName] = 0;
                }
            }
        }
    }
    
    // Variable declarations
    for(let varName of orderedVarNames) {
        let assumedDefault = assumedDefaultByVarName[varName];
        if( assumedDefault === undefined ) assumedDefault = false;
        inkLines.push(`VAR ${varName} = ${assumedDefault}`);
    }

    inkLines.push(``);
    inkLines.push(`-> ${initialKnotName}`);
    inkLines.push(``);

    for(let stitchIdx = 0; stitchIdx < story.orderedStitches.length; stitchIdx++) {

        let stitch = story.orderedStitches[stitchIdx];

        if( stitch.isHeader ) {
            var knotName = inklewriterStitchToInkNames[stitch.name];
            inkLines.push(`\n==== ${knotName} ====`);
        }

        // Do we need to label this stitch?
        else {
            let prevStitch = stitchIdx > 0 ? story.orderedStitches[stitchIdx-1] : null;
            var directlyFollowsOn = stitch.divertBackLinks.length === 1 && stitch.divertBackLinks[0] === prevStitch;
            if( !directlyFollowsOn ) {
                inkLines.push(`\n= ${inklewriterStitchToInkNames[stitch.name]}`);
            }
        }

        // Main text content for stitch
        // Think there's actually only ever one line...?
        for(let lineIdx=0; lineIdx<stitch.textContent.length; lineIdx++) {
            let line = stitch.textContent[lineIdx];
            
            // runOn (inklewriter elipsis) == ink-style glue
            let isLastLine = lineIdx === stitch.textContent.length-1;
            if( isLastLine && stitch.runOn )
                line += " <>";
            
            inkLines.push(line);
        }

        function resolveDivertTargetStr(targetPath : string, relativeStitch : Stitch) : string {
            let targetStitch = story.stitchesByName[targetPath];
            let targetName = inklewriterStitchToInkNames[targetStitch.name];
            if( !targetStitch.isHeader && targetStitch.header !== relativeStitch.header ) {
                let targetHeaderName = inklewriterStitchToInkNames[targetStitch.header!.name];
                targetName = `${targetHeaderName}.${targetName}`;
            }
            return targetName;
        }
        
        if( stitch.choices.length > 0 && stitch.divert ) 
            throw new Error("Got both choices AND a divert? Shouldn't be possible?");

        // Link up choices
        for(let choice of stitch.choices) {
            let targetName = resolveDivertTargetStr(choice.linkPath, stitch);
            inkLines.push(`+ ${choice.option} -> ${targetName}`);
        }

        // Divert, assumed to be mutually exclusive v.s. choices
        if( stitch.divert ) {
            let nextStitch = stitchIdx < story.orderedStitches.length-1 ? story.orderedStitches[stitchIdx+1] : null;
            let divertTargetFollowsOnDirectly = stitch.divertTarget === nextStitch && nextStitch && nextStitch.divertBackLinks.length === 1;
            if( !divertTargetFollowsOnDirectly ) {
                let targetName = resolveDivertTargetStr(stitch.divert, stitch);
                inkLines.push(`    -> ${targetName}`);
            }
        }

        // Assume all loose ends are complete, or not?
        if( !stitch.divert && stitch.choices.length === 0 ) {
            inkLines.push(`    -> END`);
        }
    }

    let finalInk = inkLines.join("\n");
    console.log(finalInk);

    return finalInk;
}

