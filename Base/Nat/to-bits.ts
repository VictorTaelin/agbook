import { Nat } from '../../Base/Nat/Nat';
import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';
import { $div } from '../../Base/Nat/div';
import { $mod } from '../../Base/Nat/mod';

// Helper function for to_bits that handles the recursive case.
// - n: The remaining part of the natural number to convert.
// = The binary representation of the number as Bits.
const to_bits_helper = (n: Nat): Bits => {
  if (n === 0n) {
    return $O($E);
  } else {
    var quotient = $div(n, 2n);
    var remainder = $mod(n, 2n);
    if (remainder === 0n) {
      return $O(to_bits_helper(quotient));
    } else {
      return $I(to_bits_helper(quotient));
    }
  }
};

// Converts a natural number to its binary representation.
// - n: The natural number to convert.
// = The binary representation of the number as Bits.
export const $to_bits = (n: Nat): Bits => {
  if (n === 0n) {
    return $O($E);
  } else {
    return to_bits_helper(n);
  }
};

export const to_bits = (n: Nat) => $to_bits(n);
