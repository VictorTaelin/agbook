import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is lowercase.
// - c: The character to check.
// = True if the character is lowercase, False otherwise.
export const $is_lower = (c: Char): Bool => {
  return c >= 'a' && c <= 'z';
};

export const is_lower = (c: Char) => $is_lower(c);

// NOTE: Using native string comparison for efficiency.
// This assumes ASCII encoding, which might not cover all lowercase characters in Unicode.
// For a more comprehensive solution, consider using a regular expression or a Unicode-aware library.