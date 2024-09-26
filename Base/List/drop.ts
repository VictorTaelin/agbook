import { List, $Nil, $Cons } from '../../Base/List/List';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';

// Drops the first n elements from a list.
// Returns the list without its first n elements.
export const $drop = <A>(n: Nat, xs: List<A>): List<A> => {
  if (n === 0n) {
    return xs;
  } else {
    switch (xs.$) {
      case '[]':
        return $Nil;
      case '::':
        return $drop(n - 1n, xs.tail);
    }
  }
};

export const drop = <A>(n: Nat) => (xs: List<A>) => $drop(n, xs);
