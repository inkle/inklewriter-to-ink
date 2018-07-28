import { ExecFileOptionsWithStringEncoding } from "child_process";
import { SIGUSR1 } from "constants";

interface ChoiceData {
    linkPath: string,
    ifConditions: IfConditionData[] | null,
    option: string,
    notIfConditions: NotIfConditionData[] | null
}

interface NotIfConditionData {
    notIfCondition: string
}

interface IfConditionData {
    ifCondition: string
}

interface PageNumData {
    pageNum: number
}

interface PageLabelData {
    pageLabel: string
}

interface StitchData {
    content: contentData[]
}

interface DivertData {
    divert: string
}

// Equivalent to ink glue
interface RunOnData {
    runOn: true
}

interface FlagData {
    flagName: string
}

interface ImageData {
    image: string
}

type contentData = string | ChoiceData | NotIfConditionData | IfConditionData | DivertData | RunOnData | FlagData | PageNumData | PageLabelData | ImageData;



interface InklewriterData {
    allowCheckpoints : boolean,
    optionMirroring : boolean,
    initial : string,
    stitches : {
        [name:string]: StitchData
    },
    editorData: {
        playPoint: string,
        textSize: number,
        authorName: string,
        libraryVisible: boolean
    }
}

interface InklewriterJSON {
    title : string,
    data : InklewriterData,
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

class Choice {
    text : string
    linkPath : string
    conditions : Condition[]

    constructor(data : ChoiceData) {
        this.text = data.option;
        this.linkPath = data.linkPath;
        this.conditions = [];

        if( data.ifConditions ) {
            for(let ifC of data.ifConditions) {
                this.conditions.push(new Condition(ifC.ifCondition, false));
            }
        }

        if( data.notIfConditions ) {
            for(let notIfC of data.notIfConditions) {
                this.conditions.push(new Condition(notIfC.notIfCondition, true));
            }
        }
    }
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
    constructor(name : string, data : StitchData, owner : Story) {
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
        this.choiceBackLinks = [];

        this.owner = owner;

        for(var c of data.content) {

            // Text content
            if( typeof(c) == "string" ) {
                this.textContent.push(c);
            }

            // Choice
            else if( (c as ChoiceData).option !== undefined ) {
                this.choices.push(new Choice(c as ChoiceData));
            }

            // Page num
            else if( (c as PageNumData).pageNum !== undefined ) {
                this.pageNum = this.originalPageNum = (c as PageNumData).pageNum;
            }

            // Page label
            else if( (c as PageLabelData).pageLabel !== undefined ) {
                this.pageLabel = (c as PageLabelData).pageLabel;
            }

            // ifCondition
            else if( (c as IfConditionData).ifCondition !== undefined ) {
                this.conditions.push(new Condition((c as IfConditionData).ifCondition, false));
            }

            // notIfCondition
            else if( (c as NotIfConditionData).notIfCondition !== undefined ) {
                this.conditions.push(new Condition((c as NotIfConditionData).notIfCondition, true));
            }

            // divert
            else if( (c as DivertData).divert !== undefined ) {
                this.divert = (c as DivertData).divert;
            }

            // runOn
            else if( (c as RunOnData).runOn !== undefined ) {
                this.runOn = true;
            }

            // flag
            else if( (c as FlagData).flagName !== undefined ) {
                this.flags.push(new Flag((c as FlagData).flagName));
            }

            // image
            else if( (c as ImageData).image !== undefined ) {
                this.image = (c as ImageData).image;
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
    choices : Choice[]
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
    choiceBackLinks : Stitch[]

    owner : Story
}

class Story {

    title : string
    author : string
    optionMirroring : boolean

    initialStitchName : string

    stitchesByName : { [name: string]: Stitch }
    orderedStitches : Stitch[];

    constructor(json : InklewriterJSON) {
        let data = json.data as InklewriterData;

        this.title = json.title;
        this.author = data.editorData.authorName;
        this.optionMirroring = data.optionMirroring;

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

            for(let choice of stitch.choices) {
                let choiceTarget = this.stitchesByName[choice.linkPath];
                if( choiceTarget )
                    choiceTarget.choiceBackLinks.push(stitch);
            }
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

export function convert(sourceJSON : InklewriterJSON) : string {
    
    var story = new Story(sourceJSON);

    inkLines = [];

    // Create ink-specific stitch/knot name mappings out of the inklewriter content
    let inklewriterStitchToInkNames : { [inklewriterName:string]: string} = {};
    let inkNamesUsage : { [inkName:string]: true } = {};
    for(let stitch of story.orderedStitches) {

        let inkName = stitch.name;

        if( stitch.isHeader && stitch.pageLabel )
            inkName = createIdentifierFromString(stitch.pageLabel, inkNamesUsage);

        inkNamesUsage[inkName] = true;
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

    function replaceFlagNamesWithVarNames(logicStr : string) : string {
        if( logicStr != null && logicStr.length > 0 ) {
            for(let flagName in flagNamesToVarNames) {
                let varName = flagNamesToVarNames[flagName];
                logicStr = logicStr.replace(flagName, varName);
            }
        }
        return logicStr;
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

            // Follows directly on but it's also referenced elsewhere, so let's use a weave gather point
            else if( stitch.choiceBackLinks.length > 0 ) {
                inkLines.push(` - (${inklewriterStitchToInkNames[stitch.name]})`);
            }
        }


        // Content is conditional?
        let isConditional = stitch.conditions.length > 0;
        if( isConditional ) {
            let conditionsTexts = stitch.conditions.map(cond => {
                let condTxt = cond.condition;
                condTxt = replaceFlagNamesWithVarNames(condTxt);
                if( cond.isNot )
                    condTxt = "not "+condTxt;
                return condTxt;
            });
            let conditionsStr = conditionsTexts.join(" and ");
            inkLines.push(`{ ${conditionsStr}:`);
        }

        // Flags
        // TODO: Does assignment come before or after text?
        for(let flag of stitch.flags) {
            let exprWithVars = replaceFlagNamesWithVarNames(flag.assignedExpression);
            let conditionalIndent = isConditional ? "    " : " ";
            inkLines.push(`${conditionalIndent} ~ ${flagNamesToVarNames[flag.flagName]} = ${exprWithVars}`);
        }

        // Main text content for stitch
        // Think there's actually only ever one line...?
        for(let lineIdx=0; lineIdx<stitch.textContent.length; lineIdx++) {
            let line = stitch.textContent[lineIdx];

            // Update any inline logic
            //  - Flag names to VAR names
            //  - logic tweaks - e.g. "=" to "=="
            let nextSearchPos = 0;
            do {
                let logicPos = line.indexOf("{", nextSearchPos);
                if( logicPos > -1 ) {
                    let logicEndPos = line.indexOf(":", logicPos);
                    
                    let logicTxt = line.substr(logicPos, logicEndPos-logicPos);

                    // Replace flag names with VAR names
                    let updatedLogicTxt = replaceFlagNamesWithVarNames(logicTxt);

                    // Replace single "=" with double
                    updatedLogicTxt = updatedLogicTxt.replace("=", "==");

                    let txtBefore = line.substr(0, logicPos);
                    let txtAfter = line.substr(logicEndPos);
                    line = txtBefore + updatedLogicTxt + txtAfter;

                    nextSearchPos = txtBefore.length + updatedLogicTxt.length;

                    // Was that the end of the line?
                    if( txtAfter.length <= 0 )
                        nextSearchPos = -1;
                }

                // No logic left
                else {
                    nextSearchPos = -1;
                }

            } while(nextSearchPos !== -1);

            // Italics
            line = line.replace("/=", "<em>");
            line = line.replace("=/", "</em>")

            // Bold
            line = line.replace("*-", "<strong>");
            line = line.replace("-*", "</strong>");
            
            // runOn (inklewriter elipsis) == ink-style glue
            let isLastLine = lineIdx === stitch.textContent.length-1;
            if( isLastLine && stitch.runOn )
                line += " <>";

            if( isConditional )
                line = "    " + line;
            
            inkLines.push(line);
        }

        if( isConditional )
            inkLines.push("}");

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

            let conditionsTexts = choice.conditions.map(cond => {
                let condTxt = cond.condition;
                condTxt = replaceFlagNamesWithVarNames(condTxt);
                if( cond.isNot )
                    condTxt = "not "+condTxt;
                return `{${condTxt}} `;
            });
            let conditionsStr = conditionsTexts.join("");

            // When options are mirrored it has to be a bit uglier to enforce the newline after the mirrored text
            if( story.optionMirroring ) {
                inkLines.push(`  + ${conditionsStr}${choice.text}`);
                inkLines.push(`        -> ${targetName} `);
            }
            
            // When options aren't mirrored we can include the divert on the same line.
            else {
                inkLines.push(`  + ${conditionsStr}[${choice.text}] -> ${targetName}`);
            }
        }

        // Divert, assumed to be mutually exclusive v.s. choices
        if( stitch.divert ) {
            let nextStitch = stitchIdx < story.orderedStitches.length-1 ? story.orderedStitches[stitchIdx+1] : null;
            let divertTargetFollowsOnDirectly = stitch.divertTarget === nextStitch && nextStitch && nextStitch.divertBackLinks.length === 1 && !nextStitch.isHeader;
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

