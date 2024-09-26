import { Pair } from '../../Base/Pair/Pair';

// Mutates the first element of a pair
// - f: A function to apply to the first element
// - pair: The input pair
// = A new pair with the first element transformed by f
export const $mut_fst = <A, B, C>(f: (a: A) => C, pair: Pair<A, B>): Pair<C, B> => {
  const [x, y] = pair;
  return [f(x), y];
};

export const mut_fst = <A, B, C>(f: (a: A) => C) => (pair: Pair<A, B>) => $mut_fst(f, pair);
