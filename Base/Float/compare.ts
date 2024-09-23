import { Float } from '../../Base/Float/Type';
import { Ordering, $EQ, $LT, $GT } from '../../Base/Ordering/Type';
import { $eq } from '../../Base/Float/eq';
import { $lt } from '../../Base/Float/lt';

// Compares two Float values and returns their ordering relationship.
// - x: The first Float value.
// - y: The second Float value.
// = An Ordering value representing the relationship between x and y.
export const $compare = (x: Float, y: Float): Ordering => {
  if ($eq(x, y)) {
    return $EQ;
  } else if ($lt(x, y)) {
    return $LT;
  } else {
    return $GT;
  }
};

export const compare = (x: Float) => (y: Float) => $compare(x, y);

// NOTE: Using native JavaScript comparison for efficiency.
export const $$compare = (x: Float, y: Float): Ordering => {
  if (x === y) {
    return $EQ;
  } else if (x < y) {
    return $LT;
  } else {
    return $GT;
  }
};
