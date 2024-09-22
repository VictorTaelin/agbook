"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.rshift = exports.$rshift = void 0;
const Type_1 = require("../../Base/Bits/Type");
// Performs right shift operation on a Bits value.
// - bits: The input Bits value.
// - n: The number of positions to shift right (represented as Nat).
// = A new Bits value representing the right-shifted result.
const $rshift = (bits, n) => {
    if (n === 0n) {
        return bits;
    }
    switch (bits.$) {
        case 'E':
            return Type_1.$E;
        case 'O':
        case 'I':
            return (0, exports.$rshift)(bits.tail, n - 1n);
    }
};
exports.$rshift = $rshift;
const rshift = (bits) => (n) => (0, exports.$rshift)(bits, n);
exports.rshift = rshift;
// NOTE: Operator omitted: '_>>_'.
