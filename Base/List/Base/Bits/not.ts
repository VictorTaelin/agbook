import { Bits, O, I, E } from '../../Base/Bits/Type';

// Performs bitwise NOT operation on a Bits value.
// - a: The input Bits value.
// = A new Bits value representing the bitwise NOT of a.
export const $not = (a: Bits): Bits => {
  switch (a.$) {
    case 'E':
      return E;
    case 'O':
      return I($not(a.tail));
    case 'I':
      return O($not(a.tail));
  }
};

export const not = (a: Bits) => $not(a);

// NOTE: Prefix operator omitted: '~_'.