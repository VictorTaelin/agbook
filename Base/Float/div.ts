import { Float } from '../../Base/Float/Type';

// Division of floats.
// - x: The dividend.
// - y: The divisor.
// = The quotient of x divided by y.
export const $div = (x: Float, y: Float): Float => x / y;
export const  div = (x: Float) => (y: Float) => x / y;

// NOTE: Using native JavaScript division operator for efficiency.
// NOTE: Operator '_/_' omitted in TypeScript.
