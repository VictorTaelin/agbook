import { Equal, $refl } from '../../Base/Equal/Equal';

// Congruence property of equality:
// If two values are equal, then applying a function to both yields equal results.
// - f: The function to apply.
// - x: The 1st value.
// - y: The 2nd value.
// - e: Proof that x is equal to y.
// = Proof that f x is equal to f y.
export const $apply = <A, B>(f: (a: A) => B, eq: Equal<A>): Equal<B> => {
  return $refl;
};

export const apply = <A, B>(f: (a: A) => B) => (eq: Equal<A>) => $apply(f, eq);
