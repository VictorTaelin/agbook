import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { $normal } from '../../Base/Bits/normal';
import { Nat } from '../../Base/Nat/Type';
import { $div } from '../../Base/Nat/div';
import { $eq } from '../../Base/Nat/eq';
import { $mod } from '../../Base/Nat/mod';

// Converts a natural number to its corresponding Bits representation.
// The rightmost bit is the least significant.
// - n: The natural number to convert.
// = The Bits representation of the natural number, normalized.
export const $from_nat = (n: Nat): Bits => {
  if (n === 0n) {
    return $E;
  } else {
    const go = (n: Nat, acc: (x: Bits) => Bits): Bits => {
      if (n === 0n) {
        return acc($E);
      } else {
        const rem = $mod(n, 2n);
        const quo = $div(n, 2n);
        const ctr = $eq(rem, 0n) ? $O : $I;
        return go(quo, (x: Bits) => acc(ctr(x)));
      }
    };
    return $normal(go(n, (x: Bits) => x));
  }
};

export const from_nat = (n: Nat) => $from_nat(n);
