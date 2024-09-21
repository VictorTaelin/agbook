import { Float } from '../../Base/Float/Type';
import { $mul } from '../../Base/Float/mul';

// Squares a float.
// - x: The number to square.
// = The square of x (x^2).
export const $square = (x: Float): Float => $mul(x, x);
export const  square = (x: Float) => $square(x);
