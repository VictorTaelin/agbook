import { List } from '../../Base/List/Type';
import { Nat } from '../../Base/Nat/Type';
import { Pair, $Pair } from '../../Base/Pair/Type';
import { $take } from '../../Base/List/take';
import { $drop } from '../../Base/List/drop';

// Splits a list into two parts at the specified index.
// - n: The index at which to split the list.
// - xs: The input list.
// = A pair of lists: the first n elements and the rest.
export const $split_at = <A>(n: Nat, xs: List<A>): Pair<List<A>, List<A>> => {
  return $Pair($take(n, xs), $drop(n, xs));
};

export const split_at = <A>(n: Nat) => (xs: List<A>) => $split_at(n, xs);