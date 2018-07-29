import fs = require('fs');
import {convert} from "./inklewriter-convert"

let testFiles = [
    "makeUpBreakUp",
    "musgraveritual",
    "neighbourhoodpredators",
    "theintercept",
    "whack",
    "smallsample"
]

for(let filename of testFiles) {

    let jsonText = fs.readFileSync(`test-inklewriter-json/${filename}.json`, "utf8");
    let json = JSON.parse(jsonText);

    try {

        console.time(filename);

        let inkText = convert(json);

        console.timeEnd(filename);

        fs.writeFileSync(`test-inklewriter-json/${filename}.ink`, inkText, "utf8");
    } catch(error) {
        console.error(error);
    }
}

