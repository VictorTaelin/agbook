"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_alpha = exports.$is_alpha = void 0;
// Checks if a character is alphabetic.
// - c: The character to check.
// = True if the character is alphabetic, False otherwise.
const $is_alpha = (c) => {
    return /^[a-zA-Z]$/.test(c);
};
exports.$is_alpha = $is_alpha;
const is_alpha = (c) => (0, exports.$is_alpha)(c);
exports.is_alpha = is_alpha;
// NOTE: Using a regular expression to check if the character is alphabetic.
// This is because TypeScript doesn't have a built-in isAlpha function.
