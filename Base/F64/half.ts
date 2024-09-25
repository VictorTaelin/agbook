import { F64 } from '../../Base/F64/Type';
import { $div } from '../../Base/F64/div';

// Halves the given float.
// - x: The number to half.
// = The result of x/2.
export const $half = (x: F64): F64 => $div(x, 2.0);
export const  half = (x: F64) => $half(x);

// NOTE: Using the previously defined div function for consistency with Agda implementation.
