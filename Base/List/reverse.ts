import { List, $Cons, $Nil } from '../../Base/List/Type';
import { $foldl } from '../../Base/List/foldl';

// Reverses a list.
// - xs: The input list.
// = A new list containing all elements from the input list in reverse order.
export const $reverse = <A>(xs: List<A>): List<A> => {
  return $foldl((acc: List<A>, x: A) => $Cons(x, acc), $Nil, xs);
};

export const reverse = <A>(xs: List<A>) => $reverse(xs);
