import { Float } from '../../Base/Float/Type';

// Returns the natural logarithm of a floating point number.
// - x: The floating point number.
// = The natural logarithm of x.
export const $log = (x: Float): Float => Math.log(x);
export const  log = (x: Float) => $log(x);

// NOTE: Using native JavaScript Math.log function for efficiency.