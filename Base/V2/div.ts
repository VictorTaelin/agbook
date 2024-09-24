import { V2, $MkV2 } from '../../Base/V2/Type';
import { $div as float_div } from '../../Base/F64/div';

// Divides one V2 vector by another.
// - v1: The dividend V2 vector.
// - v2: The divisor V2 vector.
// = A new V2 vector representing the component-wise division of v1 by v2.
export const $div = (v1: V2, v2: V2): V2 => {
  return $MkV2(float_div(v1.x, v2.x), float_div(v1.y, v2.y));
};

export const div = (v1: V2) => (v2: V2) => $div(v1, v2);

// NOTE: Operator '_/_' omitted in TypeScript.
