import { Bits } from '../../Base/Bits/Type';
import { $to_nat } from '../../Base/Bits/to-nat';
import { Nat } from '../../Base/Nat/Type';
import { $mod as $nat_mod } from '../../Base/Nat/mod';
import { $from_nat } from '../../Base/Bits/from-nat';

// FIXME: implement proper bitwise algorithm

// Perform bit modulo operation by converting to Nat, performing modulo, and converting back to Bits
// - a: The dividend (Bits).
// - b: The divisor (Bits).
// = The remainder of a modulo b (Bits).
export const $mod = (a: Bits, b: Bits): Bits => {
  const a_nat: Nat = $to_nat(a);
  const b_nat: Nat = $to_nat(b);
  const result_nat: Nat = $nat_mod(a_nat, b_nat);
  return $from_nat(result_nat);
};

export const mod = (a: Bits) => (b: Bits) => $mod(a, b);

// NOTE: Operator omitted: '_%_'.