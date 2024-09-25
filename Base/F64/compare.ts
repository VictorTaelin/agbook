import { F64 } from '../../Base/F64/Type';
import { Ordering, $EQ, $LT, $GT } from '../../Base/Ordering/Type';
import { $eq } from '../../Base/F64/eq';
import { $lt } from '../../Base/F64/lt';

// Compares two F64 values and returns their ordering relationship.
// - x: The first F64 value.
// - y: The second F64 value.
// = An Ordering value representing the relationship between x and y.
export const $compare = (x: F64, y: F64): Ordering => {
  if ($eq(x, y)) {
    return $EQ;
  } else if ($lt(x, y)) {
    return $LT;
  } else {
    return $GT;
  }
};

export const compare = (x: F64) => (y: F64) => $compare(x, y);

// NOTE: Using native JavaScript comparison for efficiency.
export const $$compare = (x: F64, y: F64): Ordering => {
  if (x === y) {
    return $EQ;
  } else if (x < y) {
    return $LT;
  } else {
    return $GT;
  }
};
