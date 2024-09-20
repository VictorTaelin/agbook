import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is an ASCII character.
// - c: The character to check.
// = True if the character is an ASCII character, False otherwise.
export const $is_ascii = (c: Char): Bool => {
  return c.charCodeAt(0) < 128;
};

export const is_ascii = (c: Char) => $is_ascii(c);

// NOTE: Using native string methods to implement is-ascii.
// This assumes that Char is represented as a string of length 1.
