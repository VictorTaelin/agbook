import { Float } from '../../Base/Float/Type';
import { V2 } from '../../Base/V2/Type';
import { $add } from '../../Base/V2/add';
import { $mul_scalar } from '../../Base/V2/mul-scalar';
import { $sub } from '../../Base/V2/sub';

// Performs linear interpolation between two V2 vectors.
// - v1: The starting V2 vector.
// - v2: The ending V2 vector.
// - t: The interpolation parameter (0.0 ≤ t ≤ 1.0).
// = The interpolated V2 vector.
export const $lerp = (v1: V2, v2: V2, t: Float): V2 => {
  return $add(v1, $mul_scalar($sub(v2, v1), t));
};

export const lerp = (v1: V2) => (v2: V2) => (t: Float) => $lerp(v1, v2, t);