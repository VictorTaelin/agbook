import { Char } from '../../Base/Char/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if a character is a whitespace character.
// - c: The character to check.
// = True if the character is a whitespace, False otherwise.
export const $is_space = (c: Char): Bool => {
  return /\s/.test(c);
};

export const is_space = (c: Char) => $is_space(c);

// NOTE: Using native JavaScript regex to check for whitespace.
// This includes spaces, tabs, line breaks, etc.