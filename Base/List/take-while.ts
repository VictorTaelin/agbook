import { Bool, $True, $False } from '../../Base/Bool/Type';
import { List, $Nil, $Cons } from '../../Base/List/Type';

// Takes elements from the front of the list as long as they satisfy the predicate.
// - fn: The predicate function.
// - xs: The input list.
// = A list containing the longest prefix of xs of elements that satisfy p.
export const $take_while = <A>(fn: (a: A) => Bool, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      if (fn(xs.head)) {
        return $Cons(xs.head, $take_while(fn, xs.tail));
      } else {
        return $Nil;
      }
  }
};

export const take_while = <A>(fn: (a: A) => Bool) => (xs: List<A>) => $take_while(fn, xs);