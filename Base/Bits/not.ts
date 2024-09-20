import { Bits, O, I, E } from '../../Base/Bits/Type';

// Performs bitwise NOT operation on a Bits value.
// - bits: The input Bits value.
// = A new Bits value representing the bitwise NOT of the input.
export const $not = (bits: Bits): Bits => {
  switch (bits.$) {
    case 'E':
      return E;
    case 'O':
      return I($not(bits.tail));
    case 'I':
      return O($not(bits.tail));
  }
};

export const not = (bits: Bits) => $not(bits);

// NOTE: Prefix operator '~_' omitted.
