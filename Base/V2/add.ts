import { F64 } from '../../Base/F64/Type';
import { V2, $MkV2 } from '../../Base/V2/Type';
import { $add as float_add } from '../../Base/F64/add';

// Adds two V2 vectors.
// - v1: The 1st V2 vector.
// - v2: The 2nd V2 vector.
// = A new V2 vector with the sum of the coordinates.
export const $add = (v1: V2, v2: V2): V2 => {
  return $MkV2(
    float_add(v1.x, v2.x),
    float_add(v1.y, v2.y)
  );
};

export const add = (v1: V2) => (v2: V2) => $add(v1, v2);

// NOTE: Operator omitted: '_+_'.
