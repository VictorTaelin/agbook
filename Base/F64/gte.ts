import { F64 } from '../../Base/F64/F64';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $lt } from '../../Base/F64/lt';

// Compares two F64 values for greater than or equal to relationship.
// - x: The first F64 value.
// - y: The second F64 value.
// = True if x is greater than or equal to y, False otherwise.
export const $$gte = (x: F64, y: F64): Bool => $not($lt(x, y));

// NOTE: Using native JavaScript greater than or equal to operator for efficiency.
export const $gte = (x: F64, y: F64): Bool => x >= y;
export const  gte = (x: F64) => (y: F64) => x >= y;

// NOTE: Operator omitted: '_>=_'.
