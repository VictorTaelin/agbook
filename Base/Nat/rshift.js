"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.rshift = exports.$rshift = exports.$$rshift = void 0;
const div_1 = require("../../Base/Nat/div");
const exp_1 = require("../../Base/Nat/exp");
// Performs right shift operation on a natural number.
// - n: The input natural number.
// - shift: The number of positions to shift right.
// = A new natural number representing the right-shifted result.
const $$rshift = (n, shift) => {
    return (0, div_1.$div)(n, (0, exp_1.$exp)(2n, shift));
};
exports.$$rshift = $$rshift;
// NOTE: Using native BigInt right shift for efficiency.
const $rshift = (n, shift) => n >> shift;
exports.$rshift = $rshift;
const rshift = (n) => (shift) => n >> shift;
exports.rshift = rshift;
// NOTE: Operator '_>>_' omitted.
