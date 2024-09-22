"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_lower = exports.$to_lower = void 0;
// Converts a character to lowercase.
// - c: The input character.
// = The lowercase version of the input character.
const $to_lower = (c) => c.toLowerCase();
exports.$to_lower = $to_lower;
const to_lower = (c) => (0, exports.$to_lower)(c);
exports.to_lower = to_lower;
// NOTE: Using native string method toLowerCase() for efficiency.
// This assumes that the Char type is represented as a string of length 1.
