import { List, $Nil, $Cons } from '../../Base/List/Type';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Type';

// Takes the first n elements from a list.
// If n is greater than the length of the list, returns the entire list.
// - n: The number of elements to take.
// - xs: The input list.
// = A list containing the first n elements of xs, or all of xs if n > length xs.
export const $$take = <A>(n: Nat, xs: List<A>): List<A> => {
  if (n === 0n) {
    return $Nil;
  } else {
    var pred = n - 1n;
    switch (xs.$) {
      case '[]':
        return $Nil;
      case '::':
        return $Cons(xs.head, $$take(pred, xs.tail));
    }
  }
};

// NOTE: Using more efficient implementation
export const $take = <A>(n: Nat, xs: List<A>): List<A> => {
  if (n === 0n) {
    return $Nil;
  } else {
    switch (xs.$) {
      case '[]':
        return $Nil;
      case '::':
        return $Cons(xs.head, $take(n - 1n, xs.tail));
    }
  }
};

export const take = <A>(n: Nat) => (xs: List<A>) => $take(n, xs);
