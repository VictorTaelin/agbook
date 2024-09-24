import { Float } from '../../Base/Float/Type';
import { $add } from '../../Base/Float/add';
import { $mul } from '../../Base/Float/mul';
import { $sub } from '../../Base/Float/sub';
import { V2 } from '../../Base/V2/Type';

// Calculates the squared distance between two V2 vectors.
// - v1: The first V2 vector.
// - v2: The second V2 vector.
// = The squared distance between v1 and v2.
export const $sqr_dist = (v1: V2, v2: V2): Float => {
  var dx = $sub(v2.x, v1.x);
  var dy = $sub(v2.y, v1.y);
  return $add($mul(dx, dx), $mul(dy, dy));
};

export const sqr_dist = (v1: V2) => (v2: V2) => $sqr_dist(v1, v2);