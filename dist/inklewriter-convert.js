"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function convert(sourceJSON) {
    let data = sourceJSON.data;
    let aStitch = data.stitches["theSoundOfTheImp"];
    var content = aStitch.content[0];
    return content.toString();
}
exports.convert = convert;
//# sourceMappingURL=inklewriter-convert.js.map