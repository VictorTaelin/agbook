import { List } from '../../Base/List/List';
import { $foldr } from '../../Base/List/foldr';
import { Nat, $Zero } from '../../Base/Nat/Nat';
import { $add } from '../../Base/Nat/add';

// Calculates the sum of a list of natural numbers.
// - xs: The input list of natural numbers.
// = The sum of all numbers in the list.
export const $sum = (xs: List<Nat>): Nat => $foldr($add, $Zero, xs);
export const  sum = (xs: List<Nat>) => $sum(xs);