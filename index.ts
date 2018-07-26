import fs = require('fs');
import {convert} from "./inklewriter-convert"

let interceptJSONTest = fs.readFileSync("theintercept.json", "utf8");
let interceptJSON = JSON.parse(interceptJSONTest);

try {
    let inkText = convert(interceptJSON);
    console.log(inkText);
    fs.writeFileSync("theintercept.ink", inkText, "utf8");
} catch(error) {
    console.error(error);
}

