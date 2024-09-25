import { F64 } from '../../Base/F64/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lt } from '../../Base/F64/lt';

// Compares two F64 values for greater than relationship.
// - x: The first F64 value.
// - y: The second F64 value.
// = True if x is greater than y, False otherwise.
export const $gt = (x: F64, y: F64): Bool => $lt(y, x);
export const  gt = (x: F64) => (y: F64) => $lt(y, x);

// NOTE: Using native JavaScript greater than operator for efficiency.
export const $$gt = (x: F64, y: F64): Bool => x > y;

// NOTE: Operator omitted: '_>_'.
