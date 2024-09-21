import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Maybe, $None, $Some } from '../../Base/Maybe/Type';

// Safely retrieves the first element of a list.
// - xs: The input list.
// = Some x if the list is non-empty (where x is the first element),
//   None if the list is empty.
export const $head = <A>(xs: List<A>): Maybe<A> => {
  switch (xs.$) {
    case '[]':
      return $None;
    case '::':
      return $Some(xs.head);
  }
};

export const head = <A>(xs: List<A>) => $head(xs);
