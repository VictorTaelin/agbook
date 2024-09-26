import { Char } from '../../Base/Char/Char';
import { Nat } from '../../Base/Nat/Nat';

// Converts a natural number to its corresponding character.
// - n: The natural number to convert.
// = The character corresponding to the given natural number.
export const $from_nat = (n: Nat): Char => {
  return String.fromCodePoint(Number(n));
};

export const from_nat = (n: Nat) => $from_nat(n);

// NOTE: Using native String.fromCodePoint for the conversion.
// We first convert the BigInt to a number, as fromCodePoint expects a number.
