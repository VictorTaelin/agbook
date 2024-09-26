import { Bits, $E, $O, $I } from '../../Base/Bits/Bits';
import { Bool, $True, $False } from '../../Base/Bool/Bool';

export const $eq = (a: Bits, b: Bits): Bool => {
  switch (a.$) {
    case 'E':
      return b.$ === 'E';
    case 'O':
      if (b.$ === 'O') {
        return $eq(a.tail, b.tail);
      }
      return false;
    case 'I':
      if (b.$ === 'I') {
        return $eq(a.tail, b.tail);
      }
      return false;
  }
};

export const eq = (a: Bits) => (b: Bits) => $eq(a, b);

// NOTE: Operator omitted: '_==_'.