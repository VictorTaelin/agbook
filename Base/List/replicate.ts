import { List, $Nil, $Cons } from '../../Base/List/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';

// Replicates a value n times to create a list.
// - n: The number of times to replicate the value.
// - x: The value to replicate.
// = A list consisting of n repetitions of x.
export const $replicate = <A>(n: Nat, x: A): List<A> => {
  if (n === $Zero) {
    return $Nil;
  } else {
    var pred = n - 1n;
    return $Cons(x, $replicate(pred, x));
  }
};

export const replicate = <A>(n: Nat) => (x: A) => $replicate(n, x);
