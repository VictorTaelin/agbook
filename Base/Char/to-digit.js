"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.to_digit = exports.$to_digit = void 0;
const is_digit_1 = require("../../Base/Char/is-digit");
const is_hex_digit_1 = require("../../Base/Char/is-hex-digit");
const digit_to_nat_1 = require("../../Base/Char/digit-to-nat");
const hex_to_nat_1 = require("../../Base/Char/hex-to-nat");
const eq_1 = require("../../Base/Nat/eq");
const and_1 = require("../../Base/Bool/and");
// Converts a single character to its numeric value in the given base
const $to_digit = (base, c) => {
    if ((0, is_digit_1.$is_digit)(c)) {
        return (0, digit_to_nat_1.$digit_to_nat)(c);
    }
    else if ((0, and_1.$and)((0, eq_1.$eq)(base, 16n), (0, is_hex_digit_1.$is_hex_digit)(c))) {
        return (0, hex_to_nat_1.$hex_to_nat)(c);
    }
    else {
        return { $: 'None' };
    }
};
exports.$to_digit = $to_digit;
const to_digit = (base) => (c) => (0, exports.$to_digit)(base, c);
exports.to_digit = to_digit;
