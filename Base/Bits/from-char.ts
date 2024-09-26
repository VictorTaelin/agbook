import { Bits } from '../../Base/Bits/Bits';
import { Char } from '../../Base/Char/Char';
import { $to_bits } from '../../Base/Nat/to-bits';
import { $pad_zeros } from '../../Base/Bits/pad-zeros';
import { $to_nat } from '../../Base/Char/to-nat';

export const $from_char = (char: Char): Bits => {
  return $pad_zeros(21n, $to_bits($to_nat(char)));
};

export const from_char = (char: Char) => $from_char(char);