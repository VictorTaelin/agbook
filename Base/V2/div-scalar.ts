import { F64 } from '../../Base/F64/Type';
import { $div } from '../../Base/F64/div';
import { V2, $MkV2 } from '../../Base/V2/Type';

// Divides a V2 vector by a scalar.
// - v: The V2 vector to be divided.
// - s: The scalar (F64) to divide by.
// = A new V2 vector with both components divided by the scalar.
export const $div_scalar = (v: V2, s: F64): V2 => {
  return $MkV2($div(v.x, s), $div(v.y, s));
};

export const div_scalar = (v: V2) => (s: F64) => $div_scalar(v, s);
