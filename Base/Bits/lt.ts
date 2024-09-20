import { Bits } from '../../Base/Bits/Type';
import { Bool } from '../../Base/Bool/Type';

// Performs less than comparison on two Bits values.
// - a: The 1st Bits value.
// - b: The 2nd Bits value.
// = True if a is less than b, False otherwise.
export const $lt = (a: Bits, b: Bits): Bool => {
  switch (a.$) {
    case 'E':
      switch (b.$) {
        case 'E':
          return false;
        case 'O':
        case 'I':
          return true;
      }
    case 'O':
      switch (b.$) {
        case 'E':
          return false;
        case 'O':
          return $lt(a.tail, b.tail);
        case 'I':
          return true;
      }
    case 'I':
      switch (b.$) {
        case 'E':
        case 'O':
          return false;
        case 'I':
          return $lt(a.tail, b.tail);
      }
  }
};

export const lt = (a: Bits) => (b: Bits) => $lt(a, b);

// NOTE: Operator omitted: '_<_'.
