"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_hex_digit = exports.$is_hex_digit = void 0;
// Checks if a character is a hexadecimal digit.
const $is_hex_digit = (c) => {
    const hex_digits = '0123456789ABCDEFabcdef';
    return hex_digits.includes(c);
};
exports.$is_hex_digit = $is_hex_digit;
const is_hex_digit = (c) => (0, exports.$is_hex_digit)(c);
exports.is_hex_digit = is_hex_digit;
// NOTE: Implementing is_hex_digit using JavaScript's string.includes method.
// This is equivalent to the primitive primIsHexDigit in Agda.
