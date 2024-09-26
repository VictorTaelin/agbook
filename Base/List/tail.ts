import { List, $Cons, $Nil } from '../../Base/List/List';
import { Maybe, $None, $Some } from '../../Base/Maybe/Maybe';

// Safely retrieves all elements of a list except the first one.
// - xs: The input list.
// = Some ys if the list is non-empty (where ys is the list without its first element),
//   None if the list is empty.
export const $tail = <A>(xs: List<A>): Maybe<List<A>> => {
  switch (xs.$) {
    case '[]':
      return $None;
    case '::':
      return $Some(xs.tail);
  }
};

export const tail = <A>(xs: List<A>) => $tail(xs);