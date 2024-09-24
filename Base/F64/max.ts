import { F64 } from '../../Base/F64/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $lt } from '../../Base/F64/lt';

// Returns the maximum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The larger of x and y.
export const $max = (x: F64, y: F64): F64 => {
  return $if_then_else_($lt(x, y), y, x);
};

export const max = (x: F64) => (y: F64) => $max(x, y);

// NOTE: Using native JavaScript Math.max for efficiency.
export const $$max = (x: F64, y: F64): F64 => Math.max(x, y);
