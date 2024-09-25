import { Int } from '../../Base/Int/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';

// Converts an integer to a natural number.
// - i: The integer to convert.
// = The corresponding natural number if i is non-negative.
// = Zero if i is negative.
export const $to_nat = (i: Int): Nat => {
  return i >= 0n ? (i as Nat) : $Zero;
};

export const to_nat = (i: Int) => $to_nat(i);
