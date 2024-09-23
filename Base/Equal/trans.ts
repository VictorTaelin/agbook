import { Equal, $refl } from '../../Base/Equal/Type';

// Transitivity property of equality
// If x is equal to y and y is equal to z, then x is equal to z
// - x: The first value
// - y: The second value
// - z: The third value
// - p: Proof that x is equal to y
// - q: Proof that y is equal to z
// = Proof that x is equal to z
export const $trans = <A>(_x: A, _y: A, _z: A, _p: Equal<A>, _q: Equal<A>): Equal<A> => {
  return $refl;
};

export const trans = <A>(_x: A) => (_y: A) => (_z: A) => (_p: Equal<A>) => (_q: Equal<A>): Equal<A> => {
  return $refl;
};