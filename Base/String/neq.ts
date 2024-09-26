import { String } from '../../Base/String/String';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/String/eq';

// Checks if two strings are not equal.
// - x: The first string.
// - y: The second string.
// = True if the strings are not equal, False otherwise.
export const $$neq = (x: String, y: String): Bool => $not($eq(x, y));

// NOTE: Using native string inequality for efficiency.
export const $neq = (x: String, y: String): Bool => x !== y;
export const  neq = (x: String) => (y: String) => x !== y;

// NOTE: Operator omitted: '_!=_'.