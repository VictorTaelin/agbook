import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Eq } from '../../Base/Trait/Eq';
import { $contains } from '../../Base/List/contains';
import { $filter } from '../../Base/List/filter';

// Removes duplicate elements from a list, keeping only the first occurrence of each element.
// - eq_a: The equality function for type A.
// - xs: The input list.
// = A new list with duplicates removed.
export const $dedup = <A>(eq_a: Eq<A>, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      var tail = $dedup(eq_a, xs.tail);
      return $Cons(xs.head, $filter((y) => !$contains(eq_a, y, tail), tail));
  }
};

export const dedup = <A>(eq_a: Eq<A>) => (xs: List<A>) => $dedup(eq_a, xs);
