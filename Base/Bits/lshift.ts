import { Bits, O, E } from '../../Base/Bits/Type';
import { Nat } from '../../Base/Nat/Type';

// Performs left shift operation on a Bits value.
// - bits: The input Bits value.
// - n: The number of positions to shift left (represented as Nat).
// = A new Bits value representing the left-shifted result.
export const $lshift = (bits: Bits, n: Nat): Bits => {
  if (n === 0n) {
    return bits;
  } else {
    switch (bits.$) {
      case 'E':
        return E;
      default:
        return $lshift(O(bits), n - 1n);
    }
  }
};

export const lshift = (bits: Bits) => (n: Nat) => $lshift(bits, n);

// NOTE: Operator omitted: '_<<_'.
