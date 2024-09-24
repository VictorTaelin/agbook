import { Float } from '../../Base/Float/Type';
import { $add } from '../../Base/Float/add';

// Doubles a float.
// - x: The number to double.
// = The double of x.
export const $double = (x: Float): Float => $add(x, x);
export const  double = (x: Float) => $double(x);

// NOTE: For efficiency, we could use native multiplication: x * 2
// However, we're preserving the original algorithm as specified in Agda.