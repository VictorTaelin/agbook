import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';

// Normalizes a Bits representation by removing trailing zeros from the right side.
// - bits: The input Bits value to normalize.
// = A new Bits value with trailing zeros removed.
export const $normal = (bits: Bits): Bits => {
  switch (bits.$) {
    case 'E':
      return $E;
    case 'I':
      return $I($normal(bits.tail));
    case 'O':
      var normalized_tail = $normal(bits.tail);
      if (normalized_tail.$ === 'E') {
        return $E;
      } else {
        return $O(normalized_tail);
      }
  }
};

export const normal = (bits: Bits) => $normal(bits);