import { F64 } from '../../Base/F64/F64';

// Subtraction of floats.
// - x: The number to subtract from.
// - y: The number to subtract.
// = The result of x - y.
export const $sub = (x: F64, y: F64): F64 => x - y;
export const  sub = (x: F64) => (y: F64) => x - y;

// NOTE: Using native JavaScript subtraction for efficiency.

// NOTE: Operator omitted: '_-_'.
