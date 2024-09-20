import { Equal, refl } from '../../Base/Equal/Type';

// Symmetry property of equality
// If x is equal to y, then y is equal to x
// - x: The first value
// - y: The second value
// - p: Proof that x is equal to y
// = Proof that y is equal to x
export const $sym = <A>(x: A, y: A, p: Equal<A>): Equal<A> => refl;
export const  sym = <A>(x: A) => (y: A) => (p: Equal<A>) => $sym(x, y, p);