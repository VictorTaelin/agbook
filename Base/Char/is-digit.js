"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_digit = exports.$is_digit = void 0;
// Checks if a character is a digit.
// - c: The character to check.
// = True if the character is a digit, False otherwise.
const $is_digit = (c) => {
    return /^\d$/.test(c);
};
exports.$is_digit = $is_digit;
const is_digit = (c) => (0, exports.$is_digit)(c);
exports.is_digit = is_digit;
// NOTE: Using a regular expression to check if the character is a digit.
// This is equivalent to the primitive 'primIsDigit' in Agda.
