import { List } from '../../Base/List/List';
import { Pair, $Pair } from '../../Base/Pair/Pair';
import { $cartesian_product_with } from '../../Base/List/cartesian-product-with';

// Returns the cartesian product of two lists.
// - xs: The first input list.
// - ys: The second input list.
// = A new list containing all possible pairs of elements from xs and ys.
export const $cartesian_product = <A, B>(xs: List<A>, ys: List<B>): List<Pair<A, B>> => {
  return $cartesian_product_with($Pair, xs, ys);
};

export const cartesian_product = <A, B>(xs: List<A>) => (ys: List<B>) => $cartesian_product(xs, ys);