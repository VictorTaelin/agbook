import { $eq as float_eq } from '../../Base/Float/eq';
import { Bool } from '../../Base/Bool/Type';
import { $and } from '../../Base/Bool/and';
import { Float } from '../../Base/Float/Type';
import { V2 } from '../../Base/V2/Type';

// Checks if two V2 vectors are equal.
// - v1: The first V2 vector.
// - v2: The second V2 vector.
// = True if v1 and v2 are equal, False otherwise.
export const $eq = (v1: V2, v2: V2): Bool => 
  $and(float_eq(v1.x, v2.x), float_eq(v1.y, v2.y));

export const eq = (v1: V2) => (v2: V2): Bool => $eq(v1, v2);

// NOTE: Operator omitted: '_==_'.