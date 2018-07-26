"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs = require("fs");
const inklewriter_convert_1 = require("./inklewriter-convert");
let interceptJSONTest = fs.readFileSync("theintercept.json", "utf8");
let interceptJSON = JSON.parse(interceptJSONTest);
try {
    let inkText = inklewriter_convert_1.convert(interceptJSON);
    console.log(inkText);
}
catch (error) {
    console.error(error);
}
//# sourceMappingURL=index.js.map