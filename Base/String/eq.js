"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
// Checks if two strings are equal.
// - a: The first string.
// - b: The second string.
// = True if the strings are equal, False otherwise.
const $eq = (a, b) => a === b;
exports.$eq = $eq;
const eq = (a) => (b) => a === b;
exports.eq = eq;
// NOTE: Using native string equality for efficiency.
// NOTE: Operator omitted: '_==_'.
