"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.from_nat = exports.$from_nat = void 0;
// Converts a natural number to its corresponding character.
// - n: The natural number to convert.
// = The character corresponding to the given natural number.
const $from_nat = (n) => {
    return String.fromCodePoint(Number(n));
};
exports.$from_nat = $from_nat;
const from_nat = (n) => (0, exports.$from_nat)(n);
exports.from_nat = from_nat;
// NOTE: Using native String.fromCodePoint for the conversion.
// We first convert the BigInt to a number, as fromCodePoint expects a number.
