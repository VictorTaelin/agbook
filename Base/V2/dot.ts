import { F64 } from '../../Base/F64/F64';
import { $add } from '../../Base/F64/add';
import { $mul } from '../../Base/F64/mul';
import { V2 } from '../../Base/V2/V2';

// Calculates the dot product of two V2 vectors.
// - v1: The first V2 vector.
// - v2: The second V2 vector.
// = The dot product (scalar) of v1 and v2.
export const $dot = (v1: V2, v2: V2): F64 => {
  return $add($mul(v1.x, v2.x), $mul(v1.y, v2.y));
};

export const dot = (v1: V2) => (v2: V2) => $dot(v1, v2);
