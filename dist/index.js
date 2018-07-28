"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const inklewriter_convert_1 = require("./inklewriter-convert");
let jsonText = fs.readFileSync("theintercept.json", "utf8");
let json = JSON.parse(jsonText);
try {
    let inkText = inklewriter_convert_1.convert(json);
    console.log(inkText);
    fs.writeFileSync("theintercept.ink", inkText, "utf8");
}
catch (error) {
    console.error(error);
}
//# sourceMappingURL=index.js.map