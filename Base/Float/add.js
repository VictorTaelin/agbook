"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.add = exports.$add = void 0;
// Addition of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The sum of x and y.
const $add = (x, y) => x + y;
exports.$add = $add;
const add = (x) => (y) => x + y;
exports.add = add;
// NOTE: Using native JavaScript addition for efficiency.
// The infix version of add.
// NOTE: Operator omitted: '_+_'.
