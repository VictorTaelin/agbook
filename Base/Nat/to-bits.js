"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_bits = exports.$to_bits = void 0;
const Type_1 = require("../../Base/Bits/Type");
const div_1 = require("../../Base/Nat/div");
const mod_1 = require("../../Base/Nat/mod");
// Helper function for to_bits that handles the recursive case.
// - n: The remaining part of the natural number to convert.
// = The binary representation of the number as Bits.
const to_bits_helper = (n) => {
    if (n === 0n) {
        return (0, Type_1.$O)(Type_1.$E);
    }
    else {
        var quotient = (0, div_1.$div)(n, 2n);
        var remainder = (0, mod_1.$mod)(n, 2n);
        if (remainder === 0n) {
            return (0, Type_1.$O)(to_bits_helper(quotient));
        }
        else {
            return (0, Type_1.$I)(to_bits_helper(quotient));
        }
    }
};
// Converts a natural number to its binary representation.
// - n: The natural number to convert.
// = The binary representation of the number as Bits.
const $to_bits = (n) => {
    if (n === 0n) {
        return (0, Type_1.$O)(Type_1.$E);
    }
    else {
        return to_bits_helper(n);
    }
};
exports.$to_bits = $to_bits;
const to_bits = (n) => (0, exports.$to_bits)(n);
exports.to_bits = to_bits;
