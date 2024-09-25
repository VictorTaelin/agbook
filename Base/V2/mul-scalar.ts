import { F64 } from '../../Base/F64/Type';
import { $mul } from '../../Base/F64/mul';
import { V2, $MkV2 } from '../../Base/V2/Type';

// Multiplies a V2 vector by a scalar.
// - v: The V2 vector to be multiplied.
// - s: The scalar (F64) to multiply by.
// = A new V2 vector with both components multiplied by the scalar.
export const $mul_scalar = (v: V2, s: F64): V2 => {
  return $MkV2($mul(v.x, s), $mul(v.y, s));
};

export const mul_scalar = (v: V2) => (s: F64) => $mul_scalar(v, s);
