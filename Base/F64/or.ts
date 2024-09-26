import { $not } from '../../Base/Bool/not';
import { $or as bool_or } from '../../Base/Bool/or';
import { Bool } from '../../Base/Bool/Bool';
import { F64 } from '../../Base/F64/F64';
import { $eq } from '../../Base/F64/eq';

// Performs a logical OR on two floats.
// - x: the 1st float.
// - y: the 2nd float.
// = True if either x or y (or both) are non-zero, False otherwise.
export const $$or = (x: F64, y: F64): Bool => 
  bool_or($not($eq(0.0, x)), $not($eq(0.0, y)));

// NOTE: Using native JavaScript OR and inequality for efficiency.
export const $or = (x: F64, y: F64): Bool => x !== 0 || y !== 0;
export const  or = (x: F64) => (y: F64): Bool => x !== 0 || y !== 0;

// NOTE: Operator omitted: '_||_'.
