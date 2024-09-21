import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is printable.
// - c: The character to check.
// = True if the character is printable, False otherwise.
export const $is_print = (c: Char): Bool => {
  // Using a regular expression to check if the character is printable
  return /^[\x20-\x7E]$/.test(c);
};

export const is_print = (c: Char) => $is_print(c);

// NOTE: We're using a JavaScript regular expression to implement this function,
// as there's no direct equivalent to Agda's primIsPrint in TypeScript.
// This implementation considers characters in the ASCII printable range (32-126) as printable.