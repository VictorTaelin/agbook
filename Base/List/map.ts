import { List, $Nil, $Cons } from '../../Base/List/Type';

// Applies a function to each element of a list.
// - fn: The function to be applied.
// - xs: The elements to apply f to.
// = A new list with f applied to all elements.
export const $map = <A, B>(fn: (a: A) => B, xs: List<A>): List<B> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      return $Cons(fn(xs.head), $map(fn, xs.tail));
  }
};

export const map = <A, B>(fn: (a: A) => B) => (xs: List<A>) => $map(fn, xs);
