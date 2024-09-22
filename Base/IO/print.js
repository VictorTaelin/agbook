"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.print = exports.$print = void 0;
const Type_1 = require("../../Base/Unit/Type");
// Prints a string to the console.
// - s: The string to be printed.
// = An IO action that prints the string and returns Unit.
const $print = (s) => {
    return () => Promise.resolve(console.log(s)).then(() => Type_1.$unit);
};
exports.$print = $print;
const print = (s) => (0, exports.$print)(s);
exports.print = print;
// NOTE: In TypeScript, we implement print as a function that returns a Promise.
// This matches the IO type we defined earlier and allows for asynchronous operations.
// The function logs the string to the console and then resolves with the Unit value.
