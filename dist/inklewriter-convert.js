"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class Condition {
    constructor(condition, isNot) {
        this.condition = condition;
        this.isNot = isNot;
    }
}
class Stitch {
    constructor(name, data, owner) {
        this.name = name;
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
        this.divertBackLinks = [];
        this.owner = owner;
        for (var c of data.content) {
            // Text content
            if (typeof (c) == "string") {
                this.textContent.push(c);
            }
            // Choice
            else if (c.option !== undefined) {
                this.choices.push(c);
            }
            // Page num
            else if (c.pageNum !== undefined) {
                this.pageNum = this.originalPageNum = c.pageNum;
            }
            // Page label
            else if (c.pageLabel !== undefined) {
                this.pageLabel = c.pageLabel;
            }
            // ifCondition
            else if (c.ifCondition !== undefined) {
                this.conditions.push(new Condition(c.ifCondition, false));
            }
            // notIfCondition
            else if (c.notIfCondition !== undefined) {
                this.conditions.push(new Condition(c.notIfCondition, true));
            }
            // divert
            else if (c.divert !== undefined) {
                this.divert = c.divert;
            }
            // runOn
            else if (c.runOn !== undefined) {
                this.runOn = true;
            }
            // flag
            else if (c.flagName !== undefined) {
                this.flagName = c.flagName;
            }
            // image
            else if (c.image !== undefined) {
                this.image = c.image;
            }
        }
    }
    eachLinkedStitch(func) {
        if (this.divert !== null) {
            let divertTarget = this.owner.stitchesByName[this.divert];
            func(divertTarget);
        }
        for (let c of this.choices) {
            var choiceTarget = this.owner.stitchesByName[c.linkPath];
            func(choiceTarget);
        }
    }
    get isHeader() {
        return this.distanceFromHeader === 0;
    }
    get divertTarget() {
        if (this.divert)
            return this.owner.stitchesByName[this.divert];
        else
            return null;
    }
}
class Story {
    constructor(json) {
        let data = json.data;
        this.title = json.title;
        this.author = data.editorData.authorName;
        this.initialStitchName = data.initial;
        this.stitchesByName = {};
        this.orderedStitches = [];
        for (let stitchName in data.stitches) {
            let stitchData = data.stitches[stitchName];
            let stitch = new Stitch(stitchName, stitchData, this);
            this.stitchesByName[stitchName] = stitch;
            this.orderedStitches.push(stitch);
        }
        this.calculateSectionsAndOrdering();
    }
    get firstStitch() {
        return this.stitchesByName[this.initialStitchName];
    }
    calculateSectionsAndOrdering() {
        let originalHeaders = [];
        function searchLinksForSortIndices(stitch, originalHeader, currentDepth) {
            // Explicitly numbered headers get treated specially in the main loop
            if (stitch.originalPageNum >= 0)
                return;
            // Labelled pages are also headers, but we don't know their overall ordering ahead of time
            else if (stitch.pageLabel != null) {
                currentDepth = 0;
            }
            if (stitch.distanceFromHeader === -1 || currentDepth < stitch.distanceFromHeader) {
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
        for (let originalHeader of originalHeaders) {
            originalHeader.distanceFromHeader = 0;
            originalHeader.eachLinkedStitch(subStitch => searchLinksForSortIndices(subStitch, originalHeader, 1));
        }
        let unreachedStitches = [];
        // Drop unreached stitches down to the bottom
        for (let stitch of this.orderedStitches) {
            if (stitch.pageNum === -1) {
                stitch.pageNum = 1000000;
                unreachedStitches.push(stitch);
            }
        }
        if (unreachedStitches.length > 0 && !unreachedStitches[0].pageLabel) {
            unreachedStitches[0].pageLabel = "##Unused##";
        }
        // Find the overall linear ordering of the stitches
        this.orderedStitches.sort((s1, s2) => {
            if (s1.pageNum != s2.pageNum)
                return s1.pageNum - s2.pageNum;
            else
                return s1.distanceFromHeader - s2.distanceFromHeader;
        });
        // Extract final ordered sections, and renumber
        let header = null;
        let pageNum = 0;
        for (let stitch of this.orderedStitches) {
            // Either it's an original header or it's a labelled header
            // that needs its own page number now.
            // Or it's the unused page we may have created above
            if (stitch.distanceFromHeader === 0 || stitch.pageLabel === "##Unused##") {
                header = stitch;
                pageNum++;
            }
            stitch.header = header;
            stitch.pageNum = pageNum;
        }
        // Set up backlinks
        for (let stitch of this.orderedStitches) {
            var target = stitch.divertTarget;
            if (target)
                target.divertBackLinks.push(stitch);
        }
    }
}
function createIdentifierFromString(str) {
    let id = "";
    for (let c of str) {
        // Allow a-z etc
        if (c >= '0' && c <= '9' || c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c == '_') {
            id += c;
        }
        // Convert whitespace to single '_'
        else if (c == ' ' || c == '\t') {
            if (id.length > 0 && id[id.length - 1] != "_")
                id += "_";
        }
        // skip everything else
    }
    if (id.length > 0 && id[id.length - 1] == "_") {
        id = id.substr(0, id.length - 1);
    }
    return id;
}
let inkLines;
function convert(sourceJSON) {
    var story = new Story(sourceJSON);
    inkLines = [];
    // Create ink-specific stitch/knot name mappings out of the inklewriter content
    let inklewriterStitchToInkNames = {};
    for (let stitch of story.orderedStitches) {
        let inkName = stitch.name;
        if (stitch.isHeader && stitch.pageLabel)
            inkName = createIdentifierFromString(stitch.pageLabel);
        // Avoid naming collisions
        let rootName = inkName;
        let count = 2;
        while (inklewriterStitchToInkNames[inkName]) {
            inkName = `${rootName}_${count}`;
            count++;
        }
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
    inkLines.push(``);
    inkLines.push(`-> ${initialKnotName}`);
    inkLines.push(``);
    for (let stitchIdx = 0; stitchIdx < story.orderedStitches.length; stitchIdx++) {
        let stitch = story.orderedStitches[stitchIdx];
        if (stitch.isHeader) {
            var knotName = inklewriterStitchToInkNames[stitch.name];
            inkLines.push(`\n==== ${knotName} ====`);
        }
        // Do we need to label this stitch?
        else {
            let prevStitch = stitchIdx > 0 ? story.orderedStitches[stitchIdx - 1] : null;
            var directlyFollowsOn = stitch.divertBackLinks.length === 1 && stitch.divertBackLinks[0] === prevStitch;
            if (!directlyFollowsOn) {
                inkLines.push(`\n= ${inklewriterStitchToInkNames[stitch.name]}`);
            }
        }
        // Main text content for stitch
        // Think there's actually only ever one line...?
        for (let lineIdx = 0; lineIdx < stitch.textContent.length; lineIdx++) {
            let line = stitch.textContent[lineIdx];
            // runOn (inklewriter elipsis) == ink-style glue
            let isLastLine = lineIdx === stitch.textContent.length - 1;
            if (isLastLine && stitch.runOn)
                line += " <>";
            inkLines.push(line);
        }
        function resolveDivertTargetStr(targetPath, relativeStitch) {
            let targetStitch = story.stitchesByName[targetPath];
            let targetName = inklewriterStitchToInkNames[targetStitch.name];
            if (!targetStitch.isHeader && targetStitch.header !== relativeStitch.header) {
                let targetHeaderName = inklewriterStitchToInkNames[targetStitch.header.name];
                targetName = `${targetHeaderName}.${targetName}`;
            }
            return targetName;
        }
        if (stitch.choices.length > 0 && stitch.divert)
            throw new Error("Got both choices AND a divert? Shouldn't be possible?");
        // Link up choices
        for (let choice of stitch.choices) {
            let targetName = resolveDivertTargetStr(choice.linkPath, stitch);
            inkLines.push(`+ ${choice.option} -> ${targetName}`);
        }
        // Divert, assumed to be mutually exclusive v.s. choices
        if (stitch.divert) {
            let nextStitch = stitchIdx < story.orderedStitches.length - 1 ? story.orderedStitches[stitchIdx + 1] : null;
            let divertTargetFollowsOnDirectly = stitch.divertTarget === nextStitch && nextStitch && nextStitch.divertBackLinks.length === 1;
            if (!divertTargetFollowsOnDirectly) {
                let targetName = resolveDivertTargetStr(stitch.divert, stitch);
                inkLines.push(`    -> ${targetName}`);
            }
        }
        // Assume all loose ends are complete, or not?
        if (!stitch.divert && stitch.choices.length === 0) {
            inkLines.push(`    -> END`);
        }
    }
    let finalInk = inkLines.join("\n");
    console.log(finalInk);
    return finalInk;
}
exports.convert = convert;
//# sourceMappingURL=inklewriter-convert.js.map