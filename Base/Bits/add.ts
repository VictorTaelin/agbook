import { Bits, O, I, E } from '../../Base/Bits/Type';
import { $inc } from '../../Base/Bits/inc';

// Performs addition of two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = A new Bits value representing the sum of a and b.
export const $add = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      return b;
    case 'O':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return O($add(a.tail, b.tail));
        case 'I':
          return I($add(a.tail, b.tail));
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return I($add(a.tail, b.tail));
        case 'I':
          return O($inc($add(a.tail, b.tail)));
      }
  }
};

export const add = (a: Bits) => (b: Bits) => $add(a, b);

// NOTE: Operator omitted: '_+_'.
