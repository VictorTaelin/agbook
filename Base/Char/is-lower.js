"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_lower = exports.$is_lower = void 0;
// Checks if a character is lowercase.
// - c: The character to check.
// = True if the character is lowercase, False otherwise.
const $is_lower = (c) => {
    return c >= 'a' && c <= 'z';
};
exports.$is_lower = $is_lower;
const is_lower = (c) => (0, exports.$is_lower)(c);
exports.is_lower = is_lower;
// NOTE: Using native string comparison for efficiency.
