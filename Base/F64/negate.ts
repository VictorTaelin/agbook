import { Float } from '../../Base/Float/Type';

// Negates a float 
// - x: The float to negate
// = The negated value of x
export const $negate = (x: Float): Float => -x;
export const  negate = (x: Float) => $negate(x);

// NOTE: Using native JavaScript negation operator for efficiency.