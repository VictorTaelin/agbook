"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.or = exports.$or = void 0;
const to_bits_1 = require("../../Base/U64/to-bits");
const from_nat_1 = require("../../Base/U64/from-nat");
const or_1 = require("../../Base/Bits/or");
const to_nat_1 = require("../../Base/Bits/to-nat");
// Bitwise OR operation for two U64 numbers.
// - a: The first U64 number.
// - b: The second U64 number.
// = The result of bitwise OR operation on a and b as a U64 number.
const $or = (a, b) => {
    const bits_a = (0, to_bits_1.$to_bits)(a);
    const bits_b = (0, to_bits_1.$to_bits)(b);
    const result_bits = (0, or_1.$or)(bits_a, bits_b);
    const result_nat = (0, to_nat_1.$to_nat)(result_bits);
    return (0, from_nat_1.$from_nat)(result_nat);
};
exports.$or = $or;
const or = (a) => (b) => (0, exports.$or)(a, b);
exports.or = or;
// NOTE: Operator omitted: '_||_'.
// NOTE: For efficiency, we could implement this using native bitwise OR on BigInts:
// export const $or = (a: U64, b: U64): U64 => BigInt.asUintN(64, a | b);
// However, we're keeping the implementation closer to the original Agda code for consistency.
