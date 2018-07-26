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
    firstStitch() {
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
        let first = this.firstStitch();
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
            stitch.pageNum = pageNum;
        }
    }
}
let inkLines;
function convert(sourceJSON) {
    var story = new Story(sourceJSON);
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
    for (let stitch of story.orderedStitches) {
        if (stitch.pageLabel) {
            all += `==== ${stitch.pageLabel} ====\n`;
        }
        if (stitch.pageNum)
            all += `${stitch.pageNum}: `;
        if (stitch.originalPageNum !== undefined)
            all += `(${stitch.originalPageNum})`;
        all += stitch.textContent + "\n";
    }
    console.log(all);
    return all;
    //var content = firstStitch.content[0];
    return inkLines.join("\n");
}
exports.convert = convert;
//# sourceMappingURL=inklewriter-convert.js.map