import { String } from '../../Base/String/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if two strings are equal.
// - a: The first string.
// - b: The second string.
// = True if the strings are equal, False otherwise.
export const $eq = (a: String, b: String): Bool => a === b;
export const  eq = (a: String) => (b: String) => a === b;

// NOTE: Using native string equality for efficiency.

// NOTE: Operator omitted: '_==_'.