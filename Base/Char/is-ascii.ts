import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';

// Checks if a character is an ASCII character.
// - c: The character to check.
// = True if the character is an ASCII character, False otherwise.
export const $is_ascii = (c: Char): Bool => {
  return c.charCodeAt(0) < 128;
};

export const is_ascii = (c: Char) => $is_ascii(c);

// NOTE: Implementing is_ascii using JavaScript's charCodeAt method.
// ASCII characters have code points from 0 to 127.