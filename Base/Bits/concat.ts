import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Bits, $O, $I, $E } from '../../Base/Bits/Type';

// Converts a list of Bits in to a single Bits.
// Least significant bits should be to the left of the list.
export const $concat = (bits_list: List<Bits>): Bits => {
  switch (bits_list.$) {
    case '[]':
      return $E;
    case '::':
      switch (bits_list.head.$) {
        case 'E':
          return $concat(bits_list.tail);
        case 'O':
          return $O($concat($Cons(bits_list.head.tail, bits_list.tail)));
        case 'I':
          return $I($concat($Cons(bits_list.head.tail, bits_list.tail)));
      }
  }
};

export const concat = (bits_list: List<Bits>) => $concat(bits_list);
