import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';

// Inserts an element into a sorted list, maintaining the sort order.
// - leq: The less-than-or-equal comparison function.
// - x: The element to insert.
// - xs: The sorted input list.
// = A new sorted list with x inserted in the correct position.
export const $insert_at_sorted = <A>(leq: (a: A, b: A) => Bool, x: A, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Cons(x, $Nil);
    case '::':
      var y = xs.head;
      var ys = xs.tail;
      if (leq(x, y)) {
        return $Cons(x, xs);
      } else {
        return $Cons(y, $insert_at_sorted(leq, x, ys));
      }
  }
};

export const insert_at_sorted = <A>(leq: (a: A, b: A) => Bool) => (x: A) => (xs: List<A>) => 
  $insert_at_sorted(leq, x, xs);
