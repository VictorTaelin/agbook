import { Bits } from '../../Base/Bits/Type';
import { Nat, $Zero } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';
import { $mul } from '../../Base/Nat/mul';

// Converts a Bits value to its corresponding natural number.
// The rightmost bit is the least significant.
// - bits: The Bits value to convert.
// = The natural number representation of the Bits value.
export const $to_nat = (bits: Bits): Nat => {
  const go = (bs: Bits, acc: Nat, weight: Nat): Nat => {
    switch (bs.$) {
      case 'E':
        return acc;
      case 'O':
        return go(bs.tail, acc, $mul(2n, weight));
      case 'I':
        return go(bs.tail, $add(acc, weight), $mul(2n, weight));
    }
  };
  
  return go(bits, $Zero, 1n);
};

export const to_nat = (bits: Bits) => $to_nat(bits);
