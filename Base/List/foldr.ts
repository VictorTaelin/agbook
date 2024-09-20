import { List } from '../../Base/List/Type';

// Performs a right fold over a list.
// - f: The combining function.
// - z: The initial value (for the empty list case).
// - xs: The list to fold over.
// = The result of folding the list.
export const $foldr = <A, B>(f: (a: A, b: B) => B, z: B, xs: List<A>): B => {
  switch (xs.$) {
    case '[]':
      return z;
    case '::':
      return f(xs.head, $foldr(f, z, xs.tail));
  }
};

export const foldr = <A, B>(f: (a: A, b: B) => B) => (z: B) => (xs: List<A>) => $foldr(f, z, xs);