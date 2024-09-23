import { List, $Nil, $Cons } from '../../Base/List/Type';

// Intersperses a value between all other values of a list.
// - x: The value to intersperse.
// - xs: The input list.
// = A new list with x inserted between all elements of xs.
export const $intersperse = <A>(x: A, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      if (xs.tail.$ === '[]') {
        return $Cons(xs.head, $Nil);
      } else {
        return $Cons(xs.head, $Cons(x, $intersperse(x, xs.tail)));
      }
  }
};

export const intersperse = <A>(x: A) => (xs: List<A>) => $intersperse(x, xs);