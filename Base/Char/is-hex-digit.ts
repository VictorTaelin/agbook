import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is a hexadecimal digit.
export const $is_hex_digit = (c: Char): Bool => {
  // Regular expression to match hexadecimal digits
  const hexDigitRegex = /^[0-9A-Fa-f]$/;
  return hexDigitRegex.test(c);
};

export const is_hex_digit = (c: Char) => $is_hex_digit(c);

// NOTE: Implemented using a regular expression since TypeScript
// doesn't have a built-in function for this specific check.
