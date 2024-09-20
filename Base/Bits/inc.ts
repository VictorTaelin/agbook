import { Bits, O, I, E } from '../../Base/Bits/Type';

// Increments a binary string by one. Keeps the same length.
// - bs: The input binary string.
// = The incremented binary string.
export const $inc = (bs: Bits): Bits => {
  switch (bs.$) {
    case 'E':
      return E;
    case 'O':
      return I(bs.tail);
    case 'I':
      return O($inc(bs.tail));
  }
};

export const inc = (bs: Bits) => $inc(bs);
