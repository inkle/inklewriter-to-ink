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
        
        this.textContent = [];
        this.choices = [];
        this.conditions = [];
        
        this.divert = null;
        this.runOn = false;
        this.flagName = null;
        this.image = null;

        this.pageNum = -1;
        this.originalPageNum = -1;
        this.pageLabel = null;
        this.distanceFromHeader = -1;
        this.header = null;

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
                this.flagName = (c as flag).flagName;
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
    flagName : string | null
    image : string | null

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

    firstStitch() : Stitch {
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
        let first = this.firstStitch();

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

            stitch.pageNum = pageNum;
        }

    }
}

let inkLines : string[];

export function convert(sourceJSON : inklewriterJSON) : string {
    
    var story = new Story(sourceJSON)

    inkLines = [];

    inkLines.push(`// ---- ${sourceJSON.title} ----`);
    inkLines.push(`// Converted from original URL:`);
    inkLines.push(`// http://writer.inklestudios.com/stories/${sourceJSON.url_key}`);
    inkLines.push(`# title: ${story.title}`);
    inkLines.push(`# author: ${story.author}`);
    inkLines.push(`// -----------------------------`);
    inkLines.push(``);
    inkLines.push(``);
    inkLines.push(`-> ${story.initialStitchName}`);
    inkLines.push(``);

    let all = "";
    for(let stitch of story.orderedStitches) {
        if( stitch.pageLabel ) {
            all += `==== ${stitch.pageLabel} ====\n`;
        }

        if( stitch.pageNum )
            all += `${stitch.pageNum}: `;

        if( stitch.originalPageNum !== undefined )
            all += `(${stitch.originalPageNum})`;

        all += stitch.textContent + "\n";
    }

    console.log(all);

    return all;

    //var content = firstStitch.content[0];

    return inkLines.join("\n");
}

