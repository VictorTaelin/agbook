"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_nat = exports.$to_nat = void 0;
// Converts a U64 to a Nat.
const $to_nat = (x) => {
    // Ensure the result is non-negative and within the 64-bit unsigned range
    return BigInt.asUintN(64, x);
};
exports.$to_nat = $to_nat;
const to_nat = (x) => (0, exports.$to_nat)(x);
exports.to_nat = to_nat;
// NOTE: Both U64 and Nat are represented as BigInt in TypeScript,
// but we use BigInt.asUintN to ensure the value stays within the 64-bit unsigned range.
