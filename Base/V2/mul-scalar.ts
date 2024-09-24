import { Float } from '../../Base/Float/Type';
import { $mul } from '../../Base/Float/mul';
import { V2, $MkV2 } from '../../Base/V2/Type';

// Multiplies a V2 vector by a scalar.
// - v: The V2 vector to be multiplied.
// - s: The scalar (Float) to multiply by.
// = A new V2 vector with both components multiplied by the scalar.
export const $mul_scalar = (v: V2, s: Float): V2 => {
  return $MkV2($mul(v.x, s), $mul(v.y, s));
};

export const mul_scalar = (v: V2) => (s: Float) => $mul_scalar(v, s);