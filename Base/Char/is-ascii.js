"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_ascii = exports.$is_ascii = void 0;
// Checks if a character is an ASCII character.
// - c: The character to check.
// = True if the character is an ASCII character, False otherwise.
const $is_ascii = (c) => {
    return c.charCodeAt(0) < 128;
};
exports.$is_ascii = $is_ascii;
const is_ascii = (c) => (0, exports.$is_ascii)(c);
exports.is_ascii = is_ascii;
// NOTE: Implementing is_ascii using JavaScript's charCodeAt method.
// ASCII characters have code points from 0 to 127.
