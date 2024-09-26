import { Char } from '../../Base/Char/Char';

// Converts a character to its uppercase equivalent.
// - char: The input character.
// = The uppercase version of the input character.
export const $to_upper = (char: Char): Char => {
  return char.toUpperCase();
};

export const to_upper = (char: Char) => $to_upper(char);

// NOTE: Using native JavaScript toUpperCase() method for efficiency.