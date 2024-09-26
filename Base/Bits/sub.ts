import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';
import { $dec } from '../../Base/Bits/dec';

// Performs subtraction of two Bits values.
// - a: The 1st Bits value (minuend).
// - b: The 2nd Bits value (subtrahend).
// = A new Bits value representing the difference of a and b.
export const $sub = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      return $E;
    case 'O':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return $O($sub(a.tail, b.tail));
        case 'I':
          return $I($dec($sub(a.tail, b.tail)));
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return $I($sub(a.tail, b.tail));
        case 'I':
          return $O($sub(a.tail, b.tail));
      }
  }
};

export const sub = (a: Bits) => (b: Bits) => $sub(a, b);

// NOTE: Operator omitted: '_-_'.