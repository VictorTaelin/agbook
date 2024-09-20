import { Bits, O, I, E } from '../../Base/Bits/Type';

// Appends two Bits values.
// - as: The 1st Bits value.
// - bs: The 2nd Bits value.
// = A new Bits value representing the concatenation of as and bs.
export const $append = (as: Bits, bs: Bits): Bits => {
  switch (as.$) {
    case 'E':
      return bs;
    case 'O':
      return O($append(as.tail, bs));
    case 'I':
      return I($append(as.tail, bs));
  }
};

export const append = (as: Bits) => (bs: Bits) => $append(as, bs);

// NOTE: Operator omitted: '_++_'.