import { Nat } from '../../Base/Nat/Type';
import { Pair, $Pair } from '../../Base/Pair/Type';
import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { $pad_zeros } from '../../Base/Bits/pad-zeros';

// Collects the first `m` bits of `bits` into the `fst` and the rest into the `snd`.
export const $split_at = (n: Nat, bits: Bits): Pair<Bits, Bits> => {
  if (n === 0n) {
    return $Pair($E, bits);
  } else {
    var n_ = n - 1n;
    switch (bits.$) {
      case 'E':
        return $Pair($pad_zeros(n_, $E), $E);
      case 'O': {
        var split = $split_at(n_, bits.tail);
        return $Pair($O(split[0]), split[1]);
      }
      case 'I': {
        var split = $split_at(n_, bits.tail);
        return $Pair($I(split[0]), split[1]);
      }
    }
  }
};

export const split_at = (n: Nat) => (bits: Bits) => $split_at(n, bits);
