import { Nat } from '../../Base/Nat/Type';
import { $to_bits } from '../../Base/Nat/to-bits';
import { $xor as $xor_bits } from '../../Base/Bits/xor';
import { $to_nat } from '../../Base/Bits/to-nat';

export const $xor = (a: Nat, b: Nat): Nat => {
  return $to_nat($xor_bits($to_bits(a), $to_bits(b)));
};

export const xor = (a: Nat) => (b: Nat) => $xor(a, b);

// NOTE: Operator omitted: '_^_'.