import { Nat } from '../../Base/Nat/Nat';
import { $to_bits } from '../../Base/Nat/to-bits';
import { $xor as $bits_xor } from '../../Base/Bits/xor';
import { $to_nat } from '../../Base/Bits/to-nat';

export const $xor = (a: Nat, b: Nat): Nat => {
  return $to_nat($bits_xor($to_bits(a), $to_bits(b)));
};

export const xor = (a: Nat) => (b: Nat) => $xor(a, b);

// NOTE: Operator omitted: '_^_'.