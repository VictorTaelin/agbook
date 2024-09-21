import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is a Latin-1 character.
// - c: The character to check.
// = True if the character is a Latin-1 character, False otherwise.
export const $is_latin1 = (c: Char): Bool => {
  // In JavaScript/TypeScript, we can check if a character is Latin-1
  // by checking if its Unicode code point is less than or equal to 255.
  return c.charCodeAt(0) <= 255;
};

export const is_latin1 = (c: Char) => $is_latin1(c);

// NOTE: There's no direct equivalent to 'primIsLatin1' in TypeScript,
// so we're implementing the check using character code points.