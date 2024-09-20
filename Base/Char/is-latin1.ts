import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is a Latin-1 character.
// - c: The character to check.
// = True if the character is a Latin-1 character, False otherwise.
export const $is_latin1 = (c: Char): Bool => {
  // In JavaScript/TypeScript, we can check if a character is Latin-1
  // by checking if its code point is less than or equal to 255.
  return c.charCodeAt(0) <= 255;
};

export const is_latin1 = (c: Char) => $is_latin1(c);

// NOTE: The original Agda implementation uses a primitive function.
// This TypeScript implementation provides an equivalent behavior
// using the character's code point.