import { F64 } from '../../Base/F64/Type';

// Division of floats.
// - x: The dividend.
// - y: The divisor.
// = The quotient of x divided by y.
export const $div = (x: F64, y: F64): F64 => x / y;
export const  div = (x: F64) => (y: F64) => x / y;

// NOTE: Using native JavaScript division operator for efficiency.
// NOTE: Operator '_/_' omitted in TypeScript.
