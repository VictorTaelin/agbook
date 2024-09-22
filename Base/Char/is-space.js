"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_space = exports.$is_space = void 0;
// Checks if a character is a whitespace character.
// - c: The character to check.
// = True if the character is a whitespace, False otherwise.
const $is_space = (c) => {
    return /\s/.test(c);
};
exports.$is_space = $is_space;
const is_space = (c) => (0, exports.$is_space)(c);
exports.is_space = is_space;
// NOTE: Using native JavaScript regex to check for whitespace.
// This includes spaces, tabs, line breaks, etc.
