import { List } from '../../Base/List/List';
import { Bool } from '../../Base/Bool/Bool';
import { $insertion_sort } from '../../Base/List/insertion-sort';

// Sorts a list in ascending order.
// - leq: The less-than-or-equal comparison function.
// - xs: The input list to be sorted.
// = A new list containing all elements from xs in ascending order.
export const $sort = <A>(leq: (a: A, b: A) => Bool, xs: List<A>): List<A> => {
  return $insertion_sort(leq, xs);
};

export const sort = <A>(leq: (a: A, b: A) => Bool) => (xs: List<A>) => 
  $sort(leq, xs);

// TODO: Use a better sorting algorithm