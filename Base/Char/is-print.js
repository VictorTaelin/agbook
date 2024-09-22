"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_print = exports.$is_print = void 0;
// Checks if a character is printable.
// - c: The character to check.
// = True if the character is printable, False otherwise.
const $is_print = (c) => {
    // Using a regular expression to check if the character is printable
    return /^[\x20-\x7E]$/.test(c);
};
exports.$is_print = $is_print;
const is_print = (c) => (0, exports.$is_print)(c);
exports.is_print = is_print;
// NOTE: We're using a JavaScript regular expression to implement this function,
// as there's no direct equivalent to Agda's primIsPrint in TypeScript.
// This implementation considers characters in the ASCII printable range (32-126) as printable.
