import { List } from '../../Base/List/List';
import { $foldr } from '../../Base/List/foldr';
import { Bool, $True } from '../../Base/Bool/Bool';
import { $and } from '../../Base/Bool/and';

// Checks if all elements of a list satisfy a given predicate.
// - p: The predicate function to apply to each element.
// - xs: The input list.
// = True if all elements satisfy the predicate, False otherwise.
export const $all_true = <A>(p: (a: A) => Bool, xs: List<A>): Bool => 
  $foldr((x: A, acc: Bool) => $and(p(x), acc), $True, xs);

export const all_true = <A>(p: (a: A) => Bool) => (xs: List<A>) => $all_true(p, xs);
