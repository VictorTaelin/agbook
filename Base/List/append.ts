import { List, $Cons, $Nil } from '../../Base/List/List';

// Appends two lists.
// Returns a new list containing all elements from both input lists.
export const $append = <A>(xs: List<A>, ys: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return ys;
    case '::':
      return $Cons(xs.head, $append(xs.tail, ys));
  }
};

export const append = <A>(xs: List<A>) => (ys: List<A>) => $append(xs, ys);

// NOTE: Operator omitted: '_++_'.
