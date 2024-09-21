import { Float } from '../../Base/Float/Type';
import { Bool } from '../../Base/Bool/Type';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/Float/eq';

// Checks if two Float values are not equal.
// - x: The first Float value.
// - y: The second Float value.
// = True if x and y are not equal, False otherwise.
export const $$neq = (x: Float, y: Float): Bool => $not($eq(x, y));

// NOTE: Using native JavaScript inequality operator for efficiency.
export const $neq = (x: Float, y: Float): Bool => x !== y;
export const  neq = (x: Float) => (y: Float): Bool => x !== y;

// NOTE: Operator omitted: '_!=_'.