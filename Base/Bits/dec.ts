import { Bits, O, I, E } from '../../Base/Bits/Type';

// Decrements a binary string by one. Keeps the same length.
// - bs: The input binary string.
// = The decremented binary string.
export const $dec = (bs: Bits): Bits => {
  switch (bs.$) {
    case 'E':
      return E;
    case 'O':
      return I($dec(bs.tail));
    case 'I':
      return O(bs.tail);
  }
};

export const dec = (bs: Bits) => $dec(bs);
