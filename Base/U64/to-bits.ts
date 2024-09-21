import { U64 } from '../../Base/U64/Type';
import { Bits } from '../../Base/Bits/Type';
import { Nat } from '../../Base/Nat/Type';
import { $to_bits as $to_bits_nat } from '../../Base/Nat/to-bits';
import { $to_nat } from '../../Base/U64/to-nat';

// Converts a U64 number to its binary representation.
// - n: The U64 number to convert.
// = The binary representation of the number as Bits.
export const $to_bits = (n: U64): Bits => {
  return $to_bits_nat($to_nat(n));
};

export const to_bits = (n: U64) => $to_bits(n);