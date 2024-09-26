import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';

// Reverses the order of bits in a binary string.
// - bits: The input binary string.
// = The reversed binary string.
export const $reverse = (bits: Bits): Bits => {
  const go = (acc: Bits, bits: Bits): Bits => {
    switch (bits.$) {
      case 'E':
        return acc;
      case 'O':
        return go($O(acc), bits.tail);
      case 'I':
        return go($I(acc), bits.tail);
    }
  };
  
  return go($E, bits);
};

export const reverse = (bits: Bits) => $reverse(bits);