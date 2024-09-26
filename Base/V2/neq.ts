import { F64 } from '../../Base/F64/F64';
import { Bool } from '../../Base/Bool/Bool';
import { $eq as float_eq } from '../../Base/F64/eq';
import { $and } from '../../Base/Bool/and';
import { $not } from '../../Base/Bool/not';
import { V2 } from '../../Base/V2/V2';

// Checks if two V2 vectors are not equal.
// - v1: The first V2 vector.
// - v2: The second V2 vector.
// = True if v1 and v2 are not equal, False otherwise.
export const $neq = (v1: V2, v2: V2): Bool => {
  return $not($and(float_eq(v1.x, v2.x), float_eq(v1.y, v2.y)));
};

export const neq = (v1: V2) => (v2: V2): Bool => $neq(v1, v2);

// NOTE: Operator omitted: '_!=_'.
