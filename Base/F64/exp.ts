import { F64 } from '../../Base/F64/F64';

// Exponentiation of floats.
// - x: The base float.
// - y: The exponent float.
// = The result of raising x to the power of y.
export const $exp = (x: F64, y: F64): F64 => Math.pow(x, y);
export const  exp = (x: F64) => (y: F64) => Math.pow(x, y);

// NOTE: Using native JavaScript Math.pow for efficiency.

// NOTE: Operator omitted: '_^_'.
