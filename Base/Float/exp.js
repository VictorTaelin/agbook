"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exp = exports.$exp = void 0;
// Exponentiation of floats.
// - x: The base float.
// - y: The exponent float.
// = The result of raising x to the power of y.
const $exp = (x, y) => Math.pow(x, y);
exports.$exp = $exp;
const exp = (x) => (y) => Math.pow(x, y);
exports.exp = exp;
// NOTE: Using native JavaScript Math.pow for efficiency.
// NOTE: Operator omitted: '_^_'.
