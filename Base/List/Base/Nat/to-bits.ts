import { Nat } from '../../Base/Nat/Type';
import { Bits, O, I, E } from '../../Base/Bits/Type';

export const $to_bits = (n: Nat): Bits => {
  if (n === 0n) {
    return E;
  } else {
    var pred = n - 1n;
    if (n % 2n === 0n) {
      return O($to_bits(n / 2n));
    } else {
      return I($to_bits(pred / 2n));
    }
  }
};

export const to_bits = (n: Nat) => $to_bits(n);