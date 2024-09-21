import { List, $Cons, $Nil } from '../../Base/List/Type';

// Returns all final segments of a list, longest first.
// - xs: The input list.
// = A list of lists, containing all final segments of xs.
export const $tails = <A>(xs: List<A>): List<List<A>> => {
  const tail = <A>(xs: List<A>): List<List<A>> => {
    switch (xs.$) {
      case '[]':
        return $Nil;
      case '::':
        return $Cons(xs.tail, tail(xs.tail));
    }
  };

  return $Cons(xs, tail(xs));
};

export const tails = <A>(xs: List<A>) => $tails(xs);
