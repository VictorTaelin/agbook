import { Bits } from '../../Base/Bits/Type';
import { $reverse } from '../../Base/Bits/reverse';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';

// Converts Bits to string with less significant values to the right.
// - bits: The Bits value to reverse and convert.
// = A string representation of the reversed Bits value.
export const $show_rev = (bits: Bits): String => {
  const go = (bits: Bits): String => {
    switch (bits.$) {
      case 'E':
        return "";
      case 'O':
        return $append("0", go(bits.tail));
      case 'I':
        return $append("1", go(bits.tail));
    }
  };
  
  return go($reverse(bits));
};

export const show_rev = (bits: Bits) => $show_rev(bits);