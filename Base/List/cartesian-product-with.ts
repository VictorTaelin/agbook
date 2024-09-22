import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $map } from '../../Base/List/map';
import { $append } from '../../Base/List/append';

// Returns the cartesian product of two lists, applying a given function to each pair.
// - f: The function to apply to each pair of elements.
// - xs: The first input list.
// - ys: The second input list.
// = A new list containing the results of applying f to all possible pairs from xs and ys.
export const $cartesian_product_with = <A, B, C>(
  f: (a: A, b: B) => C,
  xs: List<A>,
  ys: List<B>
): List<C> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      return $append(
        $map((y: B) => f(xs.head, y), ys),
        $cartesian_product_with(f, xs.tail, ys)
      );
  }
};

export const cartesian_product_with = <A, B, C>(f: (a: A, b: B) => C) =>
  (xs: List<A>) => (ys: List<B>) => $cartesian_product_with(f, xs, ys);