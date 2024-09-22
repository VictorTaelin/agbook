import { Float } from '../../Base/Float/Type';
import { $div } from '../../Base/Float/div';
import { $mul } from '../../Base/Float/mul';
import { $sub } from '../../Base/Float/sub';

// Computes the remainder of the division of x by y.
// - x: The dividend.
// - y: The divisor.
// = The remainder of x/y.
export const $$mod = (x: Float, y: Float): Float => {
  return $sub(x, $mul($div(x, y), y));
};

// NOTE: Using native JavaScript modulo operator for efficiency.
export const $mod = (x: Float, y: Float): Float => x % y;
export const  mod = (x: Float) => (y: Float) => x % y;

// NOTE: Operator omitted: '_%_'.
