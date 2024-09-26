import { Char } from '../../Base/Char/Char';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/Char/eq';

// Checks if two characters are not equal.
// - x: The first character.
// - y: The second character.
// = True if the characters are not equal, False otherwise.
export const $$neq = (x: Char, y: Char): Bool => $not($eq(x, y));

// NOTE: Using native string inequality for efficiency.
export const $neq = (x: Char, y: Char): Bool => x !== y;
export const  neq = (x: Char) => (y: Char): Bool => x !== y;

// NOTE: Operator omitted: '_!=_'.