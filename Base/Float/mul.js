"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.mul = exports.$mul = exports.$$mul = void 0;
// Multiplication of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The product of x and y.
const $$mul = (x, y) => {
    return x * y;
};
exports.$$mul = $$mul;
// NOTE: Using native JavaScript multiplication for efficiency.
const $mul = (x, y) => x * y;
exports.$mul = $mul;
const mul = (x) => (y) => x * y;
exports.mul = mul;
// NOTE: Operator omitted: '_*_'.
