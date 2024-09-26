import { Bits } from '../../Base/Bits/Bits';
import { Char } from '../../Base/Char/Char';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $from_nat } from '../../Base/Char/from-nat';

// Converts a Bits value to its corresponding character.
// - bits: The Bits value to convert.
// = The character representation of the Bits value.
export const $to_char = (bits: Bits): Char => {
  return $from_nat($to_nat(bits));
};

export const to_char = (bits: Bits) => $to_char(bits);
