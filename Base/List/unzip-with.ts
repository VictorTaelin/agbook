import { List, $Cons, $Nil } from '../../Base/List/List';
import { Pair } from '../../Base/Pair/Pair';

// Unzips a list with a given function that generates a pair of lists.
// - f: The function to apply to each element, generating a pair.
// - xs: The input list to unzip.
// = A pair of lists, where the first list contains all first elements of the pairs,
//   and the second list contains all second elements of the pairs.
export const $unzip_with = <A, B, C>(
  f: (a: A) => Pair<B, C>,
  xs: List<A>
): Pair<List<B>, List<C>> => {
  switch (xs.$) {
    case '[]':
      return [$Nil, $Nil];
    case '::':
      var [x, y] = f(xs.head);
      var [xs_, ys_] = $unzip_with(f, xs.tail);
      return [$Cons(x, xs_), $Cons(y, ys_)];
  }
};

export const unzip_with = <A, B, C>(f: (a: A) => Pair<B, C>) => (xs: List<A>) =>
  $unzip_with(f, xs);
