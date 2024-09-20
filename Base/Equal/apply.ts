import { Equal, refl } from '../../Base/Equal/Type';

// Congruence property of equality
// If two values are equal, then applying a function to both yields equal results
// - f: The function to apply
// - x: The first value
// - y: The second value
// - eq: Proof that x is equal to y
// = Proof that f x is equal to f y
export const $apply = <A, B>(f: (a: A) => B, eq: Equal<A>): Equal<B> => refl;
export const  apply = <A, B>(f: (a: A) => B) => (eq: Equal<A>) => $apply(f, eq);