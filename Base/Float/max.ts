import { Float } from '../../Base/Float/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $lt } from '../../Base/Float/lt';

// Returns the maximum of two floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The larger of x and y.
export const $max = (x: Float, y: Float): Float => {
  return $if_then_else_($lt(x, y), y, x);
};

export const max = (x: Float) => (y: Float) => $max(x, y);

// NOTE: Using native JavaScript Math.max for efficiency.
export const $$max = (x: Float, y: Float): Float => Math.max(x, y);