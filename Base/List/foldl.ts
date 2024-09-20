import { List } from '../../Base/List/Type';

// Performs a left fold over a list.
// - f: The combining function.
// - z: The initial value (for the empty list case).
// - xs: The list to fold over.
// = The result of folding the list.
export const $$foldl = <A, B>(f: (acc: A, x: B) => A, z: A, xs: List<B>): A => {
  switch (xs.$) {
    case '[]':
      return z;
    case '::':
      return $$foldl(f, f(z, xs.head), xs.tail);
  }
};

// NOTE: Using a loop to emulate strict tail calls with foldl.
export const $foldl = <A, B>(f: (acc: A, x: B) => A, z: A, xs: List<B>): A => {
  var acc = z;
  var current = xs;
  while (current.$ === '::') {
    acc = f(acc, current.head);
    current = current.tail;
  }
  return acc;
};

export const foldl = <A, B>(f: (acc: A, x: B) => A) => (z: A) => (xs: List<B>) => $foldl(f, z, xs);
