import { Bits } from '../../Base/Bits/Type';
import { $to_nat } from '../../Base/Bits/to-nat';
import { $from_nat } from '../../Base/Bits/from-nat';
import { $div as $nat_div } from '../../Base/Nat/div';

// FIXME: implement proper bitwise algorithm

// Perform bit division by converting to Nat, dividing, and converting back to Bits
// - a: The dividend (Bits).
// - b: The divisor (Bits).
// = The quotient of a divided by b (Bits).
export const $div = (a: Bits, b: Bits): Bits => {
  return $from_nat($nat_div($to_nat(a), $to_nat(b)));
};

export const div = (a: Bits) => (b: Bits) => $div(a, b);

// NOTE: Infix operator '_/_' omitted.