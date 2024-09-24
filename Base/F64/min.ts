import { Float } from '../../Base/Float/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $lt } from '../../Base/Float/lt';

// Returns the minimum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The smaller of x and y.
export const $min = (x: Float, y: Float): Float => {
  return $if_then_else_($lt(x, y), x, y);
};

export const min = (x: Float) => (y: Float) => $min(x, y);

// NOTE: Using native JavaScript Math.min for efficiency.
export const $$min = Math.min;