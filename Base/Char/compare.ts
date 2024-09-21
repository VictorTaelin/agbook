import { Char } from '../../Base/Char/Type';
import { $to_nat } from '../../Base/Char/to-nat';
import { Ordering } from '../../Base/Ordering/Type';
import { $compare as nat_compare } from '../../Base/Nat/compare';

// Compares two characters.
// - x: The first character.
// - y: The second character.
// = LT if x < y, EQ if x = y, GT if x > y.
export const $compare = (x: Char, y: Char): Ordering => {
  return nat_compare($to_nat(x), $to_nat(y));
};

export const compare = (x: Char) => (y: Char) => $compare(x, y);

// NOTE: Using to_nat and Nat.compare as in the Agda implementation.
