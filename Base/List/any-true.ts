import { List } from '../../Base/List/List';
import { $foldr } from '../../Base/List/foldr';
import { Bool, $False } from '../../Base/Bool/Bool';
import { $or } from '../../Base/Bool/or';

// Checks if any element of a list satisfies a given predicate.
// - p: The predicate function to apply to each element.
// - xs: The input list.
// = True if any element satisfies the predicate, False otherwise.
export const $any_true = <A>(p: (a: A) => Bool, xs: List<A>): Bool => 
  $foldr((x: A, acc: Bool) => $or(p(x), acc), $False, xs);

export const any_true = <A>(p: (a: A) => Bool) => (xs: List<A>) => $any_true(p, xs);
