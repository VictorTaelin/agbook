import { Bits } from '../../Base/Bits/Type';
import { Bool } from '../../Base/Bool/Type';

// Performs greater than comparison on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = True if a is greater than b, False otherwise.
export const $gt = (a: Bits, b: Bits): Bool => {
  switch (a.$) {
    case 'E':
      return false;
    case 'O':
      switch (b.$) {
        case 'E':
          return true;
        case 'O':
          return $gt(a.tail, b.tail);
        case 'I':
          return false;
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return true;
        case 'O':
          return true;
        case 'I':
          return $gt(a.tail, b.tail);
      }
  }
};

export const gt = (a: Bits) => (b: Bits) => $gt(a, b);

// NOTE: Operator omitted: '_>_'.
