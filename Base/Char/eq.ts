import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';

// Checks if two characters are equal.
// - a: The first character.
// - b: The second character.
// = True if the characters are equal, False otherwise.
export const $eq = (a: Char, b: Char): Bool => a === b;
export const  eq = (a: Char) => (b: Char): Bool => a === b;

// NOTE: Using native string comparison for efficiency.

// NOTE: Operator omitted: '_==_'.
