import { List, $Cons, $Nil } from '../../Base/List/List';
import { Bool } from '../../Base/Bool/Bool';
import { $insert_at_sorted } from '../../Base/List/insert-at-sorted';

// Sorts a list in ascending order using insertion sort.
// - leq: The less-than-or-equal comparison function.
// - xs: The input list to be sorted.
// = A new list containing all elements from xs in ascending order.
export const $insertion_sort = <A>(leq: (a: A, b: A) => Bool, xs: List<A>): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      var x = xs.head;
      var rest = xs.tail;
      return $insert_at_sorted(leq, x, $insertion_sort(leq, rest));
  }
};

export const insertion_sort = <A>(leq: (a: A, b: A) => Bool) => (xs: List<A>) => 
  $insertion_sort(leq, xs);