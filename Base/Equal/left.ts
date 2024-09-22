import { Equal } from '../../Base/Equal/Type';
import { $sym } from '../../Base/Equal/sym';
import { $trans } from '../../Base/Equal/trans';

// Left equality property
// If a is equal to x and b is equal to x, then a is equal to b
// - x: The common value
// - a: The first value to compare
// - b: The second value to compare
// - r: Proof that a is equal to x
// - s: Proof that b is equal to x
// = Proof that a is equal to b
export const $left = <A>(_x: A, a: A, b: A, r: Equal<A>, s: Equal<A>): Equal<A> => {
  return $trans(a, _x, b, r, $sym(_x, b, s));
};

export const left = <A>(_x: A) => (a: A) => (b: A) => (r: Equal<A>) => (s: Equal<A>): Equal<A> => {
  return $left(_x, a, b, r, s);
};