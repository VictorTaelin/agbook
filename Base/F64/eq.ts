import { F64 } from '../../Base/F64/Type';
import { Bool } from '../../Base/Bool/Type';

// Checks if two F64 values are equal.
// - a: The first F64 value.
// - b: The second F64 value.
// = True if a and b are equal, False otherwise.
export const $eq = (a: F64, b: F64): Bool => a === b;
export const  eq = (a: F64) => (b: F64): Bool => a === b;

// NOTE: Using native JavaScript equality operator for efficiency.

// NOTE: Operator omitted: '_==_'.
