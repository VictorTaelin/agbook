import { Bits } from '../../Base/Bits/Type';
import { Bool, True, False } from '../../Base/Bool/Type';

export const $lt = (a: Bits, b: Bits): Bool => {
  switch (a.$) {
    case 'E':
      switch (b.$) {
        case 'E':
          return False;
        case 'O':
        case 'I':
          return True;
      }
    case 'O':
      switch (b.$) {
        case 'E':
          return False;
        case 'O':
          return $lt(a.tail, b.tail);
        case 'I':
          return True;
      }
    case 'I':
      switch (b.$) {
        case 'E':
        case 'O':
          return False;
        case 'I':
          return $lt(a.tail, b.tail);
      }
  }
};

export const lt = (a: Bits) => (b: Bits) => $lt(a, b);

// NOTE: Operator omitted: '_<_'.