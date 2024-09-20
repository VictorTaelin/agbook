import { Bits } from '../../Base/Bits/Type';
import { Nat } from '../../Base/Nat/Type';

// Converts a Bits value to its corresponding natural number.
// The rightmost bit is the least significant.
// - bits: The Bits value to convert.
// = The natural number representation of the Bits value.
export const $to_nat = (bits: Bits): Nat => {
  const go = (bits: Bits, acc: Nat, weight: Nat): Nat => {
    switch (bits.$) {
      case 'E':
        return acc;
      case 'O':
        return go(bits.tail, acc, 2n * weight);
      case 'I':
        return go(bits.tail, acc + weight, 2n * weight);
    }
  };
  
  return go(bits, 0n, 1n);
};

export const to_nat = (bits: Bits) => $to_nat(bits);

// NOTE: Using native BigInt operations for efficiency.
