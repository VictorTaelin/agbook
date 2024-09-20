import { Bits } from '../../Base/Bits/Type';
import { Nat, Zero, Succ } from '../../Base/Nat/Type';

// Returns the length of a Bits structure, that is, how many bits it has.
export const $length = (bits: Bits): Nat => {
  switch (bits.$) {
    case 'E':
      return Zero;
    case 'O':
    case 'I':
      return Succ($length(bits.tail));
  }
};

export const length = (bits: Bits) => $length(bits);
