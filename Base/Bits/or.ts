import { Bits, $O, $I, $E } from '../../Base/Bits/Type';

// Performs bitwise OR operation on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the bitwise OR of a and b.
export const $or = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      switch (b.$) {
        case 'E':
          return $E;
        default:
          return b;
      }
    case 'O':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return $O($or(a.tail, b.tail));
        case 'I':
          return $I($or(a.tail, b.tail));
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
        case 'I':
          return $I($or(a.tail, b.tail));
      }
  }
};

export const or = (a: Bits) => (b: Bits) => $or(a, b);

// NOTE: Operator omitted: '_||_'.