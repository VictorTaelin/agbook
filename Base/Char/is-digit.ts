import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is a digit (0-9).
// - c: The character to check.
// = True if the character is a digit, False otherwise.
export const $is_digit = (c: Char): Bool => {
  return /^\d$/.test(c);
};

export const is_digit = (c: Char) => $is_digit(c);

// NOTE: Using a regular expression to check if the character is a digit.
// This is equivalent to the primitive 'primIsDigit' function in Agda.
