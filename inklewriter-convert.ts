import { ExecFileOptionsWithStringEncoding } from "child_process";
import { SIGUSR1 } from "constants";

interface choiceData {
    linkPath: string,
    ifConditions: ifConditionData[] | null,
    option: string,
    notIfConditions: notIfConditionData[] | null
}

interface notIfConditionData {
    notIfCondition: string
}

interface ifConditionData {
    ifCondition: string
}

interface pageNumData {
    pageNum: number
}

interface pageLabelData {
    pageLabel: string
}

interface stitchData {
    content: contentData[]
}

interface divertData {
    divert: string
}

// Equivalent to ink glue
interface runOnData {
    runOn: true
}

interface flagData {
    flagName: string
}

interface imageData {
    image: string
}

type contentData = string | choiceData | notIfConditionData | ifConditionData | divertData | runOnData | flagData | pageNumData | pageLabelData | imageData;



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

class Flag {

    flagName : string;
    assignedExpression : string;
    defaultValue : 0 | false;

    constructor(flagText : string) {

        var assignPos = flagText.indexOf("=");
        var mathOpPos = flagText.search(/(\+|-|\*|\/)/);

        // Explicit assignment
        // e.g. "myFlag = 5"
        if( assignPos !== -1) {
            this.flagName = flagText.substr(0, assignPos).trim(); 
            this.assignedExpression = flagText.substr(assignPos+1).trim();
            if( this.assignedExpression === "true" || this.assignedExpression === "false" )
                this.defaultValue = false;
            else
                this.defaultValue = 0;
        }

        // Mathematical expression. Assume flag name comes first.
        // e.g. "myFlag + 1"
        else if( mathOpPos !== -1 ) {
            this.flagName = flagText.substr(0, mathOpPos).trim();
            this.assignedExpression = flagText.trim();
            this.defaultValue = 0;
        }

        // Simple flag set to true expression
        // e.g. "myFlag"
        else {
            this.flagName = flagText.trim();
            this.assignedExpression = "true";
            this.defaultValue = false;
        }
    }
}

class Stitch {
    constructor(name : string, data : stitchData, owner : Story) {
        this.name = name;

        this.textContent = [];
        this.choices = [];
        this.conditions = [];
        
        this.divert = null;
        this.runOn = false;
        this.flags = [];
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
            else if( (c as choiceData).option !== undefined ) {
                this.choices.push(c as choiceData);
            }

            // Page num
            else if( (c as pageNumData).pageNum !== undefined ) {
                this.pageNum = this.originalPageNum = (c as pageNumData).pageNum;
            }

            // Page label
            else if( (c as pageLabelData).pageLabel !== undefined ) {
                this.pageLabel = (c as pageLabelData).pageLabel;
            }

            // ifCondition
            else if( (c as ifConditionData).ifCondition !== undefined ) {
                this.conditions.push(new Condition((c as ifConditionData).ifCondition, false));
            }

            // notIfCondition
            else if( (c as notIfConditionData).notIfCondition !== undefined ) {
                this.conditions.push(new Condition((c as notIfConditionData).notIfCondition, true));
            }

            // divert
            else if( (c as divertData).divert !== undefined ) {
                this.divert = (c as divertData).divert;
            }

            // runOn
            else if( (c as runOnData).runOn !== undefined ) {
                this.runOn = true;
            }

            // flag
            else if( (c as flagData).flagName !== undefined ) {
                this.flags.push(new Flag((c as flagData).flagName));
            }

            // image
            else if( (c as imageData).image !== undefined ) {
                this.image = (c as imageData).image;
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
    choices : choiceData[]
    pageNum : number
    originalPageNum : number
    header : Stitch | null
    pageLabel : string | null
    distanceFromHeader : number
    conditions : Condition[]
    divert : string | null
    runOn : boolean
    flags : Flag[]
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
    let defaultValuesByVarName : { [varName:string]: any } = {};
    for(let s of story.orderedStitches) {
        for(let flag of s.flags) {

            let varName = flagNamesToVarNames[flag.flagName];
            if( !varName ) {
                varName = createIdentifierFromString(flag.flagName, varNamesToFlagNames);
                flagNamesToVarNames[flag.flagName] = varName;
                varNamesToFlagNames[varName] = flag.flagName;
                orderedVarNames.push(varName);
            }

            if( defaultValuesByVarName[varName] === undefined )
                defaultValuesByVarName[varName] = flag.defaultValue;
        }
    }
    
    // Variable declarations
    for(let varName of orderedVarNames) {
        let assumedDefault = defaultValuesByVarName[varName];
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

