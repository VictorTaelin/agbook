import { List } from '../../Base/List/Type';
import { Bool } from '../../Base/Bool/Type';
import { Pair } from '../../Base/Pair/Type';
import { $split, split } from '../../Base/List/split';

// Splits a list at the first occurrence of the given element, removing that element.
// - eq: An equality function for the element type.
// - x: The element to split at.
// - xs: The input list.
// = A pair of lists: the part before the split element and the part after (excluding the split element).
export const $split_at_element = <A>(eq: (a: A, b: A) => Bool, x: A, xs: List<A>): Pair<List<A>, List<A>> => {
  return $split((a: A) => eq(x, a), xs);
};

export const split_at_element = <A>(eq: (a: A, b: A) => Bool) => (x: A) => (xs: List<A>) => $split_at_element(eq, x, xs);