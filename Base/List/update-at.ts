import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';

// Updates an element at a specific index in a list.
// If the index is out of bounds, the original list is returned.
// - xs: The input list.
// - n: The index at which to update the element.
// - f: The function to apply to the element at the specified index.
// = A new list with the element at index n updated, or the original list if n is out of bounds.
export const $update_at = <A>(xs: List<A>, n: Nat, f: (a: A) => A): List<A> => {
  switch (xs.$) {
    case '[]':
      return $Nil;
    case '::':
      if (n === 0n) {
        return $Cons(f(xs.head), xs.tail);
      } else {
        return $Cons(xs.head, $update_at(xs.tail, n - 1n, f));
      }
  }
};

export const update_at = <A>(xs: List<A>) => (n: Nat) => (f: (a: A) => A) => $update_at(xs, n, f);
