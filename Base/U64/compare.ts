import { U64 } from '../../Base/U64/Type';
import { Ordering, $LT, $EQ, $GT } from '../../Base/Ordering/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $eq } from '../../Base/U64/eq';
import { $lt } from '../../Base/U64/lt';

// Compares two U64 values and returns their ordering.
// - x: The first U64 value.
// - y: The second U64 value.
// = LT if x < y, EQ if x == y, GT if x > y.
export const $compare = (x: U64, y: U64): Ordering => {
  return $if_then_else_(
    $eq(x, y),
    $EQ,
    $if_then_else_($lt(x, y), $LT, $GT)
  );
};

export const compare = (x: U64) => (y: U64) => $compare(x, y);

// NOTE: For efficiency, we can use native BigInt comparison
export const $$compare = (x: U64, y: U64): Ordering => {
  if (x === y) return $EQ;
  if (x < y) return $LT;
  return $GT;
};