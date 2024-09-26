import { Bool, $True } from '../../Base/Bool/Bool';
import { List, $Cons, $Nil } from '../../Base/List/List';

// Drops elements from the front of the list as long as they satisfy the predicate.
// - fn: The predicate function.
// - xs: The input list.
// = A list containing the remaining elements after dropping the longest prefix of xs of elements that satisfy fn.
export const $drop_while = <A>(fn: (a: A) => Bool, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      if (fn(xs.head) === $True) {
        return $drop_while(fn, xs.tail);
      } else {
        return xs;
      }
  }
};

export const drop_while = <A>(fn: (a: A) => Bool) => (xs: List<A>) => $drop_while(fn, xs);
