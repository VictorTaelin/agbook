import { List, $Cons, $Nil } from '../../Base/List/List';
import { Nat } from '../../Base/Nat/Nat';
import { $append } from '../../Base/List/append';
import { $filter } from '../../Base/List/filter';
import { OrdNat } from '../../Base/Nat/Trait/Ord';
import { $lt, $gt } from '../../Base/Trait/Ord';

// Quicksort algorithm for sorting lists of natural numbers.
// - xs: The input list to be sorted.
// = A new list containing all elements from xs in ascending order.
export const $quicksort = (xs: List<Nat>): List<Nat> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      var x = xs.head;
      var rest = xs.tail;
      var min = $filter((y: Nat) => $lt(OrdNat, y, x), rest);
      var max = $filter((y: Nat) => $gt(OrdNat, y, x), rest);
      return $append($quicksort(min), $Cons(x, $quicksort(max)));
  }
};

export const quicksort = (xs: List<Nat>) => $quicksort(xs);
