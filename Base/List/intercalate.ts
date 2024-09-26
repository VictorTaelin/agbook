import { List, $Cons, $Nil } from '../../Base/List/List';
import { $append } from '../../Base/List/append';

// Intercalates a list between all lists in a list of lists.
// - xs: The list to be inserted between other lists.
// - yss: The list of lists to intercalate xs into.
// = A new list with xs inserted between all lists in yss.
export const $intercalate = <A>(xs: List<A>, yss: List<List<A>>): List<A> => {
  switch (yss.$) {
    case '[]':
      return $Nil;
    case '::':
      if (yss.tail.$ === '[]') {
        return yss.head;
      } else {
        return $append(yss.head, $append(xs, $intercalate(xs, yss.tail)));
      }
  }
};

export const intercalate = <A>(xs: List<A>) => (yss: List<List<A>>) => $intercalate(xs, yss);