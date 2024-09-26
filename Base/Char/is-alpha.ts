import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';

// Checks if a character is alphabetic.
// - c: The character to check.
// = True if the character is alphabetic, False otherwise.
export const $is_alpha = (c: Char): Bool => {
  return /^[a-zA-Z]$/.test(c);
};

export const is_alpha = (c: Char) => $is_alpha(c);

// NOTE: Using a regular expression to check if the character is alphabetic.
// This is because TypeScript doesn't have a built-in isAlpha function.