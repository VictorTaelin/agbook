import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';

// Decrements a binary string by one, potentially reducing its size.
// - bs: The input binary string.
// = The decremented binary string, with leading zeros removed.
export const $pred = (bs: Bits): Bits => {
  switch (bs.$) {
    case 'E':
      return $E;
    case 'O':
      if (bs.tail.$ === 'E') {
        return $E;
      } else {
        return $I($pred(bs.tail));
      }
    case 'I':
      return $O(bs.tail);
  }
};

export const pred = (bs: Bits) => $pred(bs);

// Examples:
// pred E             = E       (0 -> 0)
// pred (I E)         = O E     (1 -> 0)
// pred (O (I E))     = I E     (10 -> 1)
// pred (I (I E))     = O (I E) (11 -> 10)
// pred (O (O (I E))) = I (I E) (100 -> 11)
