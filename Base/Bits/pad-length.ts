import { Bits } from '../../Base/Bits/Type';
import { $length } from '../../Base/Bits/length';
import { $pad_zeros } from '../../Base/Bits/pad-zeros';
import { Pair, $Pair } from '../../Base/Pair/Type';
import { Nat } from '../../Base/Nat/Type';
import { $max } from '../../Base/Nat/max';

// Ensures two Bits values have the same length by padding with leading zeros.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A pair of Bits values with equal length, padded if necessary.
export const $pad_length = (a: Bits, b: Bits): Pair<Bits, Bits> => {
  var len_a = $length(a);
  var len_b = $length(b);
  var trg_len = $max(len_a, len_b);
  return $Pair($pad_zeros(trg_len, a), $pad_zeros(trg_len, b));
};

export const pad_length = (a: Bits) => (b: Bits) => $pad_length(a, b);
