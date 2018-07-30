# inklewriter-to-ink

This project converts [inklewriter](https://www.inklestudios.com/inklewriter) stories to [ink](https://www.inklestudios.com/ink).

**[Convert your story on the inkle website](https://www.inklestudios.com/inklewriter/to-ink)**

It's written in TypeScript. The main guts are in **inklewriter-convert.ts**. The live hosted site consists of 3 files:

 * dist/inklewriter-convert.js (the compile TypeScript file)
 * index.html
 * style.css

To test, the file **test.ts** is run, which loads up some sample inklewriter JSON files in **test-inklewriter-json**, and converts them to ink. The sample results are included for easy diffing when changes are made to the converter.

MIT Licensed.
