"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
// Checks if two characters are equal.
// - a: The first character.
// - b: The second character.
// = True if the characters are equal, False otherwise.
const $eq = (a, b) => a === b;
exports.$eq = $eq;
const eq = (a) => (b) => a === b;
exports.eq = eq;
// NOTE: Using native string comparison for efficiency.
// NOTE: Operator omitted: '_==_'.
