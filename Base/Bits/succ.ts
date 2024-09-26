import { Bits, $O, $I, $E } from '../../Base/Bits/Bits';

// Increments a binary string by one, increasing its size if necessary.
// - bs: The input binary string.
// = The incremented binary string, with an additional bit if needed.
export const $succ = (bs: Bits): Bits => {
  switch (bs.$) {
    case 'E':
      return $I($E);
    case 'O':
      return $I(bs.tail);
    case 'I':
      return $O($succ(bs.tail));
  }
};

export const succ = (bs: Bits) => $succ(bs);

// Examples:
// succ E         = I E         (0 -> 1)
// succ (O E)     = I E         (0 -> 1)
// succ (I E)     = O (I E)     (1 -> 10)
// succ (I (I E)) = O (O (I E)) (11 -> 100)