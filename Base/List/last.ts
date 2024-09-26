import { List, $Cons, $Nil } from '../../Base/List/List';
import { Maybe, $None, $Some } from '../../Base/Maybe/Maybe';

// Safely retrieves the last element of a list.
// - xs: The input list.
// = Some x if the list is non-empty (where x is the last element),
//   None if the list is empty.
export const $last = <A>(xs: List<A>): Maybe<A> => {
  switch (xs.$) {
    case '[]':
      return $None;
    case '::':
      if (xs.tail.$ === '[]') {
        return $Some(xs.head);
      } else {
        return $last(xs.tail);
      }
  }
};

export const last = <A>(xs: List<A>) => $last(xs);
