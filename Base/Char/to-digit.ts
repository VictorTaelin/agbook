import { Nat } from '../../Base/Nat/Type';
import { Char } from '../../Base/Char/Type';
import { Maybe } from '../../Base/Maybe/Type';
import { $is_digit } from '../../Base/Char/is-digit';
import { $is_hex_digit } from '../../Base/Char/is-hex-digit';
import { $digit_to_nat } from '../../Base/Char/digit-to-nat';
import { $hex_to_nat } from '../../Base/Char/hex-to-nat';
import { $eq } from '../../Base/Nat/eq';
import { $and } from '../../Base/Bool/and';

// Converts a single character to its numeric value in the given base
export const $to_digit = (base: Nat, c: Char): Maybe<Nat> => {
  if ($is_digit(c)) {
    return $digit_to_nat(c);
  } else if ($and($eq(base, 16n), $is_hex_digit(c))) {
    return $hex_to_nat(c);
  } else {
    return { $: 'None' };
  }
};

export const to_digit = (base: Nat) => (c: Char) => $to_digit(base, c);
