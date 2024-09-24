import { Equal } from '../../Base/Equal/Type';
import { $sym } from '../../Base/Equal/sym';
import { $trans } from '../../Base/Equal/trans';

// Right equality property.
// If x is equal to a and x is equal to b, then a is equal to b.
// - x: The common value.
// - a: The 1st value to compare.
// - b: The 2nd value to compare.
// - r: Proof that x is equal to a.
// - s: Proof that x is equal to b.
// = Proof that a is equal to b.
export const $right = <A>(_x: A, a: A, b: A, r: Equal<A>, s: Equal<A>): Equal<A> => {
  return $trans(a, _x, b, $sym(_x, a, r), s);
};

export const right = <A>(_x: A) => (a: A) => (b: A) => (r: Equal<A>) => (s: Equal<A>): Equal<A> => {
  return $right(_x, a, b, r, s);
};