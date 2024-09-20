import { Bits, O, I, E } from '../../Base/Bits/Type';
import { Nat } from '../../Base/Nat/Type';

export const $from_nat = (n: Nat): Bits => {
  if (n === 0n) {
    return E;
  } else {
    const remainder = n % 2n;
    const quotient = n / 2n;
    if (remainder === 0n) {
      return O($from_nat(quotient));
    } else {
      return I($from_nat(quotient));
    }
  }
};

export const from_nat = (n: Nat) => $from_nat(n);