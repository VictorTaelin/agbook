import { List, $Cons, $Nil } from '../../Base/List/List';
import { Nat, $Zero } from '../../Base/Nat/Nat';

// Removes the element at the specified index from the list.
// If the index is out of bounds, returns the original list.
// - n: The index of the element to remove.
// - xs: The input list.
// = A new list with the element at index n removed, or the original list if n is out of bounds.
export const $remove_at = <A>(xs: List<A>, n: Nat): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      if (n === 0n) {
        return xs.tail;
      } else {
        return $Cons(xs.head, $remove_at(xs.tail, n - 1n));
      }
  }
};

export const remove_at = <A>(xs: List<A>) => (n: Nat) => $remove_at(xs, n);
