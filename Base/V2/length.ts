import { Float } from '../../Base/Float/Type';
import { $add } from '../../Base/Float/add';
import { $mul } from '../../Base/Float/mul';
import { $sqrt } from '../../Base/Float/sqrt';
import { V2 } from '../../Base/V2/Type';

// Calculates the length (magnitude) of a V2 vector.
// - v: The V2 vector.
// = The length of the vector.
export const $length = (v: V2): Float => {
  var x_squared = $mul(v.x, v.x);
  var y_squared = $mul(v.y, v.y);
  var sum_of_squares = $add(x_squared, y_squared);
  return $sqrt(sum_of_squares);
};

export const length = (v: V2) => $length(v);

// NOTE: For efficiency, we could use native JavaScript operations:
// export const $length = (v: V2): Float => Math.sqrt(v.x * v.x + v.y * v.y);
// However, we're using the imported functions to maintain consistency with the Agda implementation.