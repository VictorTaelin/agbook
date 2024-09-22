"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.is_latin1 = exports.$is_latin1 = void 0;
// Checks if a character is a Latin-1 character.
// - c: The character to check.
// = True if the character is a Latin-1 character, False otherwise.
const $is_latin1 = (c) => {
    // In JavaScript/TypeScript, we can check if a character is Latin-1
    // by checking if its Unicode code point is less than or equal to 255.
    return c.charCodeAt(0) <= 255;
};
exports.$is_latin1 = $is_latin1;
const is_latin1 = (c) => (0, exports.$is_latin1)(c);
exports.is_latin1 = is_latin1;
// NOTE: There's no direct equivalent to 'primIsLatin1' in TypeScript,
// so we're implementing the check using character code points.
