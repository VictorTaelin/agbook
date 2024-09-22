"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sqrt = exports.$sqrt = void 0;
// Computes the square root of a float.
// Returns NaN for negative numbers.
// - x: The float to take the square root of.
// = The square root of x.
const $sqrt = (x) => Math.sqrt(x);
exports.$sqrt = $sqrt;
const sqrt = (x) => (0, exports.$sqrt)(x);
exports.sqrt = sqrt;
// NOTE: Using native JavaScript Math.sqrt function for efficiency.
