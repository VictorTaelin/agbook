import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';

// Checks if a character is lowercase.
// - c: The character to check.
// = True if the character is lowercase, False otherwise.
export const $is_lower = (c: Char): Bool => {
  return c >= 'a' && c <= 'z';
};

export const is_lower = (c: Char) => $is_lower(c);

// NOTE: Using native string comparison for efficiency.