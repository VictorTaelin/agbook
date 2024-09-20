import { Char } from '../../Base/Char/Type';

// Converts a character to uppercase.
// - c: The input character.
// = The uppercase version of the input character.
export const $to_upper = (c: Char): Char => c.toUpperCase();
export const  to_upper = (c: Char) => $to_upper(c);

// NOTE: Using native string method toUpperCase() for efficiency.
// This works because we're representing Char as a string of length 1.