import { F64 } from '../../Base/F64/Type';
import { $div } from '../../Base/F64/div';
import { $mul } from '../../Base/F64/mul';
import { $sub } from '../../Base/F64/sub';

// Computes the remainder of the division of x by y.
// - x: The dividend.
// - y: The divisor.
// = The remainder of x/y.
export const $$mod = (x: F64, y: F64): F64 => {
  return $sub(x, $mul($div(x, y), y));
};

// NOTE: Using native JavaScript modulo operator for efficiency.
export const $mod = (x: F64, y: F64): F64 => x % y;
export const  mod = (x: F64) => (y: F64) => x % y;

// NOTE: Operator omitted: '_%_'.
