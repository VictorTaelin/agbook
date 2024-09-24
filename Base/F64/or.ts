import { $not } from '../../Base/Bool/not';
import { $or as bool_or } from '../../Base/Bool/or';
import { Bool } from '../../Base/Bool/Type';
import { Float } from '../../Base/Float/Type';
import { $eq } from '../../Base/Float/eq';

// Performs a logical OR on two floats.
// - x: the 1st float.
// - y: the 2nd float.
// = True if either x or y (or both) are non-zero, False otherwise.
export const $$or = (x: Float, y: Float): Bool => 
  bool_or($not($eq(0.0, x)), $not($eq(0.0, y)));

// NOTE: Using native JavaScript OR and inequality for efficiency.
export const $or = (x: Float, y: Float): Bool => x !== 0 || y !== 0;
export const  or = (x: Float) => (y: Float): Bool => x !== 0 || y !== 0;

// NOTE: Operator omitted: '_||_'.
