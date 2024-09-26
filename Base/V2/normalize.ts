import { V2 } from '../../Base/V2/V2';
import { $div_scalar } from '../../Base/V2/div-scalar';
import { $length } from '../../Base/V2/length';

// Normalizes a V2 vector (makes it a unit vector).
// - v: The V2 vector to normalize.
// = A new V2 vector with the same direction but unit length.
export const $normalize = (v: V2): V2 => {
  var len = $length(v);
  return $div_scalar(v, len);
};

export const normalize = (v: V2) => $normalize(v);