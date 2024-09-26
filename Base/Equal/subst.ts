import { Equal } from '../../Base/Equal/Equal';

// Substitution property of equality:
// If x is equal to y, then a predicate P holding for x also holds for y.
// - P: The predicate.
// - x: The 1st value.
// - y: The 2nd value.
// - e: Proof that x is equal to y.
// - p: Proof that P holds for x.
// = Proof that P holds for y.
export const $subst = <A, B>(
  P: (a: A) => B,
  _x: A,
  _y: A,
  _eq: Equal<A>,
  px: B
): B => px;

export const subst = <A, B>(P: (a: A) => B) =>
  (_x: A) => (_y: A) => (_eq: Equal<A>) => (px: B) => px;

// NOTE: In TypeScript, we can't actually prove equality or use it for substitution
// in the type system. The implementation simply returns the proof for x,
// as we can't distinguish between x and y at runtime.