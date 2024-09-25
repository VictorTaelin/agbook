import { F64 } from '../../Base/F64/Type';

// Negates a float 
// - x: The float to negate
// = The negated value of x
export const $negate = (x: F64): F64 => -x;
export const  negate = (x: F64) => $negate(x);

// NOTE: Using native JavaScript negation operator for efficiency.
