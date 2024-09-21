import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';

// Compares two Float values for less than relationship.
// - a: The first Float value.
// - b: The second Float value.
// = True if a is less than b, False otherwise.
export const $lt = (a: Float, b: Float): Bool => a < b;
export const  lt = (a: Float) => (b: Float) => a < b;

// NOTE: Using native JavaScript less than operator for efficiency.

// NOTE: Operator omitted: '_<_'.