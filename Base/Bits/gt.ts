import { Bits } from '../../Base/Bits/Bits';
import { Bool, True, False } from '../../Base/Bool/Bool';

export const $gt = (a: Bits, b: Bits): Bool => {
  switch (a.$) {
    case 'E':
      return False;
    case 'O':
      switch (b.$) {
        case 'E':
          return True;
        case 'O':
          return $gt(a.tail, b.tail);
        case 'I':
          return False;
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return True;
        case 'O':
          return True;
        case 'I':
          return $gt(a.tail, b.tail);
      }
  }
};

export const gt = (a: Bits) => (b: Bits) => $gt(a, b);

// NOTE: Operator omitted: '_>_'.