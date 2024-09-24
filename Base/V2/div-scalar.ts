import { Float } from '../../Base/Float/Type';
import { $div } from '../../Base/Float/div';
import { V2, $MkV2 } from '../../Base/V2/Type';

// Divides a V2 vector by a scalar.
// - v: The V2 vector to be divided.
// - s: The scalar (Float) to divide by.
// = A new V2 vector with both components divided by the scalar.
export const $div_scalar = (v: V2, s: Float): V2 => {
  return $MkV2($div(v.x, s), $div(v.y, s));
};

export const div_scalar = (v: V2) => (s: Float) => $div_scalar(v, s);