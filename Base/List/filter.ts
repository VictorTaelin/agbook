import { List, $Cons, $Nil } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';

// Filters a list based on a predicate function.
// - fn: The function used to test each element.
// - xs: The input list.
// = A new list containing only elements that satisfy the predicate.
export const $filter = <A>(fn: (a: A) => Bool, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      var result = fn(xs.head);
      if (result) {
        return $Cons(xs.head, $filter(fn, xs.tail));
      } else {
        return $filter(fn, xs.tail);
      }
  }
};

export const filter = <A>(fn: (a: A) => Bool) => (xs: List<A>) => $filter(fn, xs);
