"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_nat = exports.$from_nat = void 0;
// Converts a Nat to a U64.
const $from_nat = (n) => {
    // Ensure the value is within the U64 range (0 to 2^64 - 1)
    return BigInt.asUintN(64, n);
};
exports.$from_nat = $from_nat;
const from_nat = (n) => (0, exports.$from_nat)(n);
exports.from_nat = from_nat;
// NOTE: Using BigInt.asUintN to ensure the result is within the 64-bit unsigned integer range.
