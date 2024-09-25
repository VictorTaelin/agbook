import { V2, $MkV2 } from '../../Base/V2/Type';
import { $sub as float_sub } from '../../Base/F64/sub';

// Subtracts one V2 vector from another.
// - v1: The first V2 vector (minuend).
// - v2: The second V2 vector (subtrahend).
// = A new V2 vector representing the difference between v1 and v2.
export const $sub = (v1: V2, v2: V2): V2 => 
  $MkV2(float_sub(v1.x, v2.x), float_sub(v1.y, v2.y));

export const sub = (v1: V2) => (v2: V2) => $sub(v1, v2);

// NOTE: Using native JavaScript subtraction for efficiency.
export const $$sub = (v1: V2, v2: V2): V2 => 
  $MkV2(v1.x - v2.x, v1.y - v2.y);

// NOTE: Operator omitted: '_-_'.
