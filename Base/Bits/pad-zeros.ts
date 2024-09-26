import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';

// Pads Bits with insignificant zeroes to achieve a specific length.
// - n: The desired length of the resulting Bits.
// - bits: The original Bits to be padded.
// = A new Bits value with the same significance as the input, 
//   but padded with leading zeroes to reach the specified length.
export const $pad_zeros = (n: Nat, bits: Bits): Bits => {
  if (n === 0n) {
    return bits;
  } else {
    var n_ = n - 1n;
    switch (bits.$) {
      case 'E':
        return $O($pad_zeros(n_, $E));
      case 'O':
        return $O($pad_zeros(n_, bits.tail));
      case 'I':
        return $I($pad_zeros(n_, bits.tail));
    }
  }
};

export const pad_zeros = (n: Nat) => (bits: Bits) => $pad_zeros(n, bits);
