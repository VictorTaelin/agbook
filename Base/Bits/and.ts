import { Bits, O, I, E } from '../../Base/Bits/Bits';

// Performs bitwise AND operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise AND of a and b.
export const $and = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      return E;
    case 'O':
      switch (b.$) {
        case 'E':
          return E;
        case 'O':
          return O($and(a.tail, b.tail));
        case 'I':
          return O($and(a.tail, b.tail));
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return E;
        case 'O':
          return O($and(a.tail, b.tail));
        case 'I':
          return I($and(a.tail, b.tail));
      }
  }
};

export const and = (a: Bits) => (b: Bits) => $and(a, b);

// NOTE: Operator omitted: '_&&_'.
