import { List, $Cons, $Nil } from '../../Base/List/List';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';
import { Maybe, $None, $Some } from '../../Base/Maybe/Maybe';

// Retrieves the element at the specified index in the list.
// - xs: The input list.
// - i: The index to retrieve.
// = Just the element at index i if i < length xs, otherwise None.
export const $lookup = <A>(xs: List<A>, i: Nat): Maybe<A> => {
  switch (xs.$) {
    case '[]':
      return $None;
    case '::':
      if (i === 0n) {
        return $Some(xs.head);
      } else {
        return $lookup(xs.tail, i - 1n);
      }
  }
};

export const lookup = <A>(xs: List<A>) => (i: Nat) => $lookup(xs, i);