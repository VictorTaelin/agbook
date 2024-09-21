import { Float } from '../../Base/Float/Type';
import { $div } from '../../Base/Float/div';

// Halves the given float.
// - x: The number to half.
// = The result of x/2.
export const $half = (x: Float): Float => $div(x, 2.0);
export const  half = (x: Float) => $half(x);

// NOTE: Using the previously defined div function for consistency with Agda implementation.