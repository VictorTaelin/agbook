import { Char } from '../../Base/Char/Char';

// Converts a character to lowercase.
// - c: The input character.
// = The lowercase version of the input character.
export const $to_lower = (c: Char): Char => c.toLowerCase();
export const  to_lower = (c: Char) => $to_lower(c);

// NOTE: Using native string method toLowerCase() for efficiency.
// This assumes that the Char type is represented as a string of length 1.
