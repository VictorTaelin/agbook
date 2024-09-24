import { F64 } from '../../Base/F64/Type';

// Addition of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The sum of x and y.
export const $add = (x: F64, y: F64): F64 => x + y;
export const  add = (x: F64) => (y: F64) => x + y;

// NOTE: Using native JavaScript addition for efficiency.

// The infix version of add.
// NOTE: Operator omitted: '_+_'.
