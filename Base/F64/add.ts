import { Float } from '../../Base/Float/Type';

// Addition of floats.
// - x: The 1st float.
// - y: The 2nd float.
// = The sum of x and y.
export const $add = (x: Float, y: Float): Float => x + y;
export const  add = (x: Float) => (y: Float) => x + y;

// NOTE: Using native JavaScript addition for efficiency.

// The infix version of add.
// NOTE: Operator omitted: '_+_'.
