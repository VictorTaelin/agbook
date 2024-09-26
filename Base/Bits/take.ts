import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';

// Takes the first n bits from a Bits structure.
// If n is greater than the length of the Bits, returns the entire Bits structure.
// - n: The number of bits to take.
// - bits: The input Bits structure.
// = A Bits structure containing the first n bits of the input, or all of the input if n > length bits.
export const $take = (n: Nat, bits: Bits): Bits => {
  if (n === 0n) {
    return $E;
  } else {
    var n_ = n - 1n;
    switch (bits.$) {
      case 'E':
        return $E;
      case 'O':
        return $O($take(n_, bits.tail));
      case 'I':
        return $I($take(n_, bits.tail));
    }
  }
};

export const take = (n: Nat) => (bits: Bits) => $take(n, bits);
