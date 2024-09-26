import { F64 } from '../../Base/F64/F64';
import { $add } from '../../Base/F64/add';
import { $mul } from '../../Base/F64/mul';
import { $sqrt } from '../../Base/F64/sqrt';
import { V2 } from '../../Base/V2/V2';

// Calculates the length (magnitude) of a V2 vector.
// - v: The V2 vector.
// = The length of the vector.
export const $length = (v: V2): F64 => {
  var x_squared = $mul(v.x, v.x);
  var y_squared = $mul(v.y, v.y);
  var sum_of_squares = $add(x_squared, y_squared);
  return $sqrt(sum_of_squares);
};

export const length = (v: V2) => $length(v);

// NOTE: For efficiency, we could use native JavaScript operations:
// export const $length = (v: V2): F64 => Math.sqrt(v.x * v.x + v.y * v.y);
// However, we're using the imported functions to maintain consistency with the Agda implementation.
