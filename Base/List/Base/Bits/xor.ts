import { Bits, O, I, E } from '../../Base/Bits/Type';

export const $xor = (a: Bits, b: Bits): Bits => {
  switch (a.$) {
    case 'E':
      switch (b.$) {
        case 'E':
          return E;
        default:
          return b;
      }
    case 'O':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return O($xor(a.tail, b.tail));
        case 'I':
          return I($xor(a.tail, b.tail));
      }
    case 'I':
      switch (b.$) {
        case 'E':
          return a;
        case 'O':
          return I($xor(a.tail, b.tail));
        case 'I':
          return O($xor(a.tail, b.tail));
      }
  }
};

export const xor = (a: Bits) => (b: Bits) => $xor(a, b);

// NOTE: Operator omitted: '_^_'.