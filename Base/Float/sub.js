"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sub = exports.$sub = void 0;
// Subtraction of floats.
// - x: The number to subtract from.
// - y: The number to subtract.
// = The result of x - y.
const $sub = (x, y) => x - y;
exports.$sub = $sub;
const sub = (x) => (y) => x - y;
exports.sub = sub;
// NOTE: Using native JavaScript subtraction for efficiency.
// NOTE: Operator omitted: '_-_'.
