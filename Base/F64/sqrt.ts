import { F64 } from '../../Base/F64/F64';

// Computes the square root of a float.
// Returns NaN for negative numbers.
// - x: The float to take the square root of.
// = The square root of x.
export const $sqrt = (x: F64): F64 => Math.sqrt(x);
export const  sqrt = (x: F64) => $sqrt(x);

// NOTE: Using native JavaScript Math.sqrt function for efficiency.
