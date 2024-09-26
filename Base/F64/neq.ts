import { F64 } from '../../Base/F64/F64';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/F64/eq';

// Checks if two F64 values are not equal.
// - x: The first F64 value.
// - y: The second F64 value.
// = True if x and y are not equal, False otherwise.
export const $$neq = (x: F64, y: F64): Bool => $not($eq(x, y));

// NOTE: Using native JavaScript inequality operator for efficiency.
export const $neq = (x: F64, y: F64): Bool => x !== y;
export const  neq = (x: F64) => (y: F64): Bool => x !== y;

// NOTE: Operator omitted: '_!=_'.
