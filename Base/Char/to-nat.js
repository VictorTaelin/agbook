"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_nat = exports.$to_nat = void 0;
// Converts a character to its Unicode code point.
// - c: The input character.
// = The Unicode code point of the character as a Nat (BigInt).
const $to_nat = (c) => BigInt(c.charCodeAt(0));
exports.$to_nat = $to_nat;
const to_nat = (c) => (0, exports.$to_nat)(c);
exports.to_nat = to_nat;
// NOTE: Using native JavaScript charCodeAt method and converting to BigInt for efficiency.
