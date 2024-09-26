import { List, $Cons, $Nil } from '../../../Base/List/List';
import { $append } from '../../../Base/List/append';

// The bind function for the List monad.
// Applies a function that returns a list to each element of a list,
// then flattens the result.
// - xs: The input list.
// - f: The function to apply to each element.
// = A new list resulting from applying f to each element and concatenating the results.
export const $bind = <A, B>(xs: List<A>, f: (a: A) => List<B>): List<B> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      return $append(f(xs.head), $bind(xs.tail, f));
  }
};

export const bind = <A, B>(xs: List<A>) => (f: (a: A) => List<B>) => $bind(xs, f);

// NOTE: Operator omitted: '_>>=_'.