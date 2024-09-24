import { Float } from '../../Base/Float/Type';

// Multiplication of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The product of x and y.
export const $$mul = (x: Float, y: Float): Float => {
  return x * y;
};

// NOTE: Using native JavaScript multiplication for efficiency.
export const $mul = (x: Float, y: Float): Float => x * y;
export const  mul = (x: Float) => (y: Float) => x * y;

// NOTE: Operator omitted: '_*_'.