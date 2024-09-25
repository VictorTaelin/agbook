import { F64 } from '../../Base/F64/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lt } from '../../Base/F64/lt';

// Compares two F64 values for less than or equal to relationship.
// - x: The first F64 value.
// - y: The second F64 value.
// = True if x is less than or equal to y, False otherwise.
export const $$lte = (x: F64, y: F64): Bool => {
  return !$lt(y, x);
};

// NOTE: Using native JavaScript less than or equal to operator for efficiency.
export const $lte = (x: F64, y: F64): Bool => x <= y;
export const  lte = (x: F64) => (y: F64) => x <= y;

// NOTE: Operator omitted: '_<=_'.
