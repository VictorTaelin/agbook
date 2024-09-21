import { List, $Nil, $Cons } from '../../Base/List/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';

// Generates a list by iterating a function over an initial value.
// - f: The function to be applied repeatedly.
// - x: The initial value.
// - n: The number of iterations.
// = A list containing the results of applying f repeatedly, n times.
export const $iterate = <A>(f: (a: A) => A, x: A, n: Nat): List<A> => {
  if (n === $Zero) {
    return $Nil;
  } else {
    var pred = n - 1n;
    return $Cons(x, $iterate(f, f(x), pred));
  }
};

export const iterate = <A>(f: (a: A) => A) => (x: A) => (n: Nat) => $iterate(f, x, n);