import { Equal, refl } from '../../Base/Equal/Type';

// Transitivity property of equality
// If x is equal to y and y is equal to z, then x is equal to z
// - x: The first value
// - y: The second value
// - z: The third value
// - p: Proof that x is equal to y
// - q: Proof that y is equal to z
// = Proof that x is equal to z
export const $trans = <A>(x: A, y: A, z: A, p: Equal<A>, q: Equal<A>): Equal<A> => refl;
export const  trans = <A>(x: A) => (y: A) => (z: A) => (p: Equal<A>) => (q: Equal<A>) => $trans(x, y, z, p, q);
