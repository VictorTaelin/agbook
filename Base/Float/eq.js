"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eq = exports.$eq = void 0;
// Checks if two Float values are equal.
// - a: The first Float value.
// - b: The second Float value.
// = True if a and b are equal, False otherwise.
const $eq = (a, b) => a === b;
exports.$eq = $eq;
const eq = (a) => (b) => a === b;
exports.eq = eq;
// NOTE: Using native JavaScript equality operator for efficiency.
// NOTE: Operator omitted: '_==_'.
