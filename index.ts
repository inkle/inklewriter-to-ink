import fs = require('fs');
import {convert} from "./inklewriter-convert"

let jsonText = fs.readFileSync("theintercept.json", "utf8");
let json = JSON.parse(jsonText);

try {
    let inkText = convert(json);
    console.log(inkText);
    fs.writeFileSync("theintercept.ink", inkText, "utf8");
} catch(error) {
    console.error(error);
}

