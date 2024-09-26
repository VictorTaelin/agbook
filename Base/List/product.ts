import { List } from '../../Base/List/List';
import { Nat } from '../../Base/Nat/Nat';
import { $foldr } from '../../Base/List/foldr';
import { $mul } from '../../Base/Nat/mul';

// Calculates the product of a list of natural numbers.
// - xs: The input list of natural numbers.
// = The product of all numbers in the list.
export const $product = (xs: List<Nat>): Nat => $foldr($mul, 1n, xs);

export const product = (xs: List<Nat>) => $product(xs);
