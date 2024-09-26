import { List, $Cons, $Nil } from '../../Base/List/List';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';

// Inserts an element at a specific index in a list.
// If the index is out of bounds, the element is appended to the end of the list.
// - n: The index at which to insert the element.
// - x: The element to insert.
// - xs: The input list.
// = A new list with the element inserted at the specified index.
export const $insert_at = <A>(xs: List<A>, n: Nat, v: A): List<A> => {
  if (n === 0n) {
    return $Cons(v, xs);
  } else {
    switch (xs.$) {
      case '[]':
        return $Cons(v, $Nil);
      case '::':
        return $Cons(xs.head, $insert_at(xs.tail, n - 1n, v));
    }
  }
};

export const insert_at = <A>(xs: List<A>) => (n: Nat) => (v: A) => $insert_at(xs, n, v);
