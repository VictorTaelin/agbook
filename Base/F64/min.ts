import { F64 } from '../../Base/F64/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $lt } from '../../Base/F64/lt';

// Returns the minimum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The smaller of x and y.
export const $min = (x: F64, y: F64): F64 => {
  return $if_then_else_($lt(x, y), x, y);
};

export const min = (x: F64) => (y: F64) => $min(x, y);

// NOTE: Using native JavaScript Math.min for efficiency.
export const $$min = Math.min;
