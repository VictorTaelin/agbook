"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_upper = exports.$to_upper = void 0;
// Converts a character to its uppercase equivalent.
// - char: The input character.
// = The uppercase version of the input character.
const $to_upper = (char) => {
    return char.toUpperCase();
};
exports.$to_upper = $to_upper;
const to_upper = (char) => (0, exports.$to_upper)(char);
exports.to_upper = to_upper;
// NOTE: Using native JavaScript toUpperCase() method for efficiency.
