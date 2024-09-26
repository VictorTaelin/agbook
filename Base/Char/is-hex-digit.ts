import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';

// Checks if a character is a hexadecimal digit.
export const $is_hex_digit = (c: Char): Bool => {
  const hex_digits = '0123456789ABCDEFabcdef';
  return hex_digits.includes(c);
};

export const is_hex_digit = (c: Char) => $is_hex_digit(c);

// NOTE: Implementing is_hex_digit using JavaScript's string.includes method.
// This is equivalent to the primitive primIsHexDigit in Agda.
