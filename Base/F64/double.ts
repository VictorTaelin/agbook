import { F64 } from '../../Base/F64/F64';
import { $add } from '../../Base/F64/add';

// Doubles a float.
// - x: The number to double.
// = The double of x.
export const $double = (x: F64): F64 => $add(x, x);
export const  double = (x: F64) => $double(x);

// NOTE: For efficiency, we could use native multiplication: x * 2
// However, we're preserving the original algorithm as specified in Agda.
