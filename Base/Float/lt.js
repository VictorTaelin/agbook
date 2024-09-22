"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.lt = exports.$lt = void 0;
// Compares two Float values for less than relationship.
// - a: The first Float value.
// - b: The second Float value.
// = True if a is less than b, False otherwise.
const $lt = (a, b) => a < b;
exports.$lt = $lt;
const lt = (a) => (b) => a < b;
exports.lt = lt;
// NOTE: Using native JavaScript less than operator for efficiency.
// NOTE: Operator omitted: '_<_'.
