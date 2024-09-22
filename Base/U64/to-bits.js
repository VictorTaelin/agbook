"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_bits = exports.$to_bits = void 0;
const to_bits_1 = require("../../Base/Nat/to-bits");
const to_nat_1 = require("../../Base/U64/to-nat");
// Converts a U64 number to its binary representation.
// - n: The U64 number to convert.
// = The binary representation of the number as Bits.
const $to_bits = (n) => {
    return (0, to_bits_1.$to_bits)((0, to_nat_1.$to_nat)(n));
};
exports.$to_bits = $to_bits;
const to_bits = (n) => (0, exports.$to_bits)(n);
exports.to_bits = to_bits;
