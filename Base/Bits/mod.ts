import { Bits } from '../../Base/Bits/Bits';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $from_nat } from '../../Base/Bits/from-nat';
import { $mod as $nat_mod } from '../../Base/Nat/mod';

// Perform bit modulo operation by converting to Nat, performing modulo, and converting back to Bits
// - a: The dividend (Bits).
// - b: The divisor (Bits).
// = The remainder of a modulo b (Bits).
export const $mod = (a: Bits, b: Bits): Bits => {
  return $from_nat($nat_mod($to_nat(a), $to_nat(b)));
};

export const mod = (a: Bits) => (b: Bits) => $mod(a, b);

// NOTE: Operator omitted: '_%_'.

// FIXME: implement proper bitwise algorithm?
