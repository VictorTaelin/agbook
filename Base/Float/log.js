"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.log = exports.$log = void 0;
// Returns the natural logarithm of a floating point number.
// - x: The floating point number.
// = The natural logarithm of x.
const $log = (x) => Math.log(x);
exports.$log = $log;
const log = (x) => (0, exports.$log)(x);
exports.log = log;
// NOTE: Using native JavaScript Math.log function for efficiency.
