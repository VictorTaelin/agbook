import { List, $Cons } from '../../Base/List/Type';
import { Bits, O, I, E } from '../../Base/Bits/Type';

// Converts a list of Bits in to a single Bits.
// Least significant bits should be to the left of the list.
export const $concat = (xs: List<Bits>): Bits => {
  switch (xs.$) {
    case '[]':
      return E;
    case '::':
      switch (xs.head.$) {
        case 'E':
          return $concat(xs.tail);
        case 'O':
          return O($concat($Cons(xs.head.tail, xs.tail)));
        case 'I':
          return I($concat($Cons(xs.head.tail, xs.tail)));
      }
  }
};

export const concat = (xs: List<Bits>) => $concat(xs);
