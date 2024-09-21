import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if two Float values are equal.
// - a: The first Float value.
// - b: The second Float value.
// = True if a and b are equal, False otherwise.
export const $eq = (a: Float, b: Float): Bool => a === b;
export const  eq = (a: Float) => (b: Float): Bool => a === b;

// NOTE: Using native JavaScript equality operator for efficiency.

// NOTE: Operator omitted: '_==_'.