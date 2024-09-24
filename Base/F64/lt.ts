import { F64 } from '../../Base/F64/Type';
import { Bool } from '../../Base/Bool/Type';

// Compares two F64 values for less than relationship.
// - a: The first F64 value.
// - b: The second F64 value.
// = True if a is less than b, False otherwise.
export const $lt = (a: F64, b: F64): Bool => a < b;
export const  lt = (a: F64) => (b: F64) => a < b;

// NOTE: Using native JavaScript less than operator for efficiency.

// NOTE: Operator omitted: '_<_'.
