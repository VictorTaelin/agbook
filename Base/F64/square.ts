import { F64 } from '../../Base/F64/Type';
import { $mul } from '../../Base/F64/mul';

// Squares a float.
// - x: The number to square.
// = The square of x (x^2).
export const $square = (x: F64): F64 => $mul(x, x);
export const  square = (x: F64) => $square(x);
