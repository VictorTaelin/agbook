import { Float } from '../../Base/Float/Type';

// Exponentiation of floats.
// - x: The base float.
// - y: The exponent float.
// = The result of raising x to the power of y.
export const $exp = (x: Float, y: Float): Float => Math.pow(x, y);
export const  exp = (x: Float) => (y: Float) => Math.pow(x, y);

// NOTE: Using native JavaScript Math.pow for efficiency.

// NOTE: Operator omitted: '_^_'.
