"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_char = exports.$to_char = void 0;
const to_nat_1 = require("../../Base/Bits/to-nat");
const from_nat_1 = require("../../Base/Char/from-nat");
// Converts a Bits value to its corresponding character.
// - bits: The Bits value to convert.
// = The character representation of the Bits value.
const $to_char = (bits) => {
    return (0, from_nat_1.$from_nat)((0, to_nat_1.$to_nat)(bits));
};
exports.$to_char = $to_char;
const to_char = (bits) => (0, exports.$to_char)(bits);
exports.to_char = to_char;
