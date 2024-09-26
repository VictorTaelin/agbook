import { F64 } from '../../Base/F64/F64';

// Multiplication of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The product of x and y.
export const $$mul = (x: F64, y: F64): F64 => {
  return x * y;
};

// NOTE: Using native JavaScript multiplication for efficiency.
export const $mul = (x: F64, y: F64): F64 => x * y;
export const  mul = (x: F64) => (y: F64) => x * y;

// NOTE: Operator omitted: '_*_'.
