import { F64 } from '../../Base/F64/F64';

// Returns the natural logarithm of a floating point number.
// - x: The floating point number.
// = The natural logarithm of x.
export const $log = (x: F64): F64 => Math.log(x);
export const  log = (x: F64) => $log(x);

// NOTE: Using native JavaScript Math.log function for efficiency.
