"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const inklewriter_convert_1 = require("./inklewriter-convert");
let testFiles = [
    "makeUpBreakUp",
    "musgraveritual",
    "neighbourhoodpredators",
    "theintercept",
    "whack",
    "smallsample"
];
for (let filename of testFiles) {
    let jsonText = fs.readFileSync(`test-inklewriter-json/${filename}.json`, "utf8");
    let json = JSON.parse(jsonText);
    try {
        console.time(filename);
        let inkText = inklewriter_convert_1.convert(json);
        console.timeEnd(filename);
        fs.writeFileSync(`test-inklewriter-json/${filename}.ink`, inkText, "utf8");
    }
    catch (error) {
        console.error(error);
    }
}
//# sourceMappingURL=index.js.map