import { Float } from '../../Base/Float/Type';

// Computes the square root of a float.
// Returns NaN for negative numbers.
// - x: The float to take the square root of.
// = The square root of x.
export const $sqrt = (x: Float): Float => Math.sqrt(x);
export const  sqrt = (x: Float) => $sqrt(x);

// NOTE: Using native JavaScript Math.sqrt function for efficiency.
