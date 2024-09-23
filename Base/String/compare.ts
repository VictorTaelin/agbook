import { String } from '../../Base/String/Type';
import { Ordering, $EQ, $LT, $GT } from '../../Base/Ordering/Type';
import { $eq } from '../../Base/String/eq';
import { $lt } from '../../Base/String/lt';
import { $if_then_else_ } from '../../Base/Bool/if';

export const $compare = (s1: String, s2: String): Ordering => {
  return $if_then_else_(
    $eq(s1, s2),
    $EQ,
    $if_then_else_(
      $lt(s1, s2),
      $LT,
      $GT
    )
  );
};

export const compare = (s1: String) => (s2: String) => $compare(s1, s2);

// NOTE: For efficiency, we can use the native string comparison
export const $$compare = (s1: String, s2: String): Ordering => {
  if (s1 === s2) return $EQ;
  return s1 < s2 ? $LT : $GT;
};
