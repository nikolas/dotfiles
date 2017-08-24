#!/usr/bin/env node
/**
 * Parse the given file as JSON, then overwrites it in standard
 * formatted JSON.
 */

var fs = require('fs');

if (!process.argv[2]) {
    console.error('Usage: formatjson.js <filename.json>');
    process.exit(1);
}

var filename = process.argv[2];

var json = fs.readFileSync(filename);
var obj = JSON.parse(json);
fs.writeFile(filename, JSON.stringify(obj, null, 4));
console.log('Wrote to: ' + filename);
