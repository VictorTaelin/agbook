import { Float } from '../../Base/Float/Type';

// Subtraction of floats.
// - x: The number to subtract from.
// - y: The number to subtract.
// = The result of x - y.
export const $sub = (x: Float, y: Float): Float => x - y;
export const  sub = (x: Float) => (y: Float) => x - y;

// NOTE: Using native JavaScript subtraction for efficiency.

// NOTE: Operator omitted: '_-_'.
