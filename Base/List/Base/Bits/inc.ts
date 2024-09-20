import { Bits, O, I, E } from '../../Base/Bits/Type';

// Increments a Bits value by 1.
// - b: The input Bits value.
// = A new Bits value representing b + 1.
export const $inc = (b: Bits): Bits => {
  switch (b.$) {
    case 'E':
      return I(E);
    case 'O':
      return I(b.tail);
    case 'I':
      return O($inc(b.tail));
  }
};

export const inc = (b: Bits) => $inc(b);