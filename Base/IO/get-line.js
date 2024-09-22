"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.get_line = exports.$get_line = void 0;
var readline = require("readline");
// Reads a line of input from the console.
// = A Promise that resolves to the input string.
var $get_line = function () {
    return new Promise(function (resolve) {
        var rl = readline.createInterface({
            input: process.stdin,
            output: process.stdout
        });
        rl.question('', function (answer) {
            rl.close();
            resolve(answer);
        });
    });
};
exports.$get_line = $get_line;
exports.get_line = exports.$get_line;
