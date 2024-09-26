import { List } from '../../Base/List/List';
import { $concat } from '../../Base/List/concat';
import { $map } from '../../Base/List/map';

// Maps elements of a list to lists and concatenates the results.
// - f: The function that maps elements to lists.
// - xs: The input list.
// = A new list containing all elements from the lists produced by f.
export const $concat_map = <A, B>(f: (a: A) => List<B>, xs: List<A>): List<B> => {
  return $concat($map(f, xs));
};

export const concat_map = <A, B>(f: (a: A) => List<B>) => (xs: List<A>) => $concat_map(f, xs);
