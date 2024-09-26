import { BitMap, $Node, $Leaf } from './Type';
import { Bits, $E, $O, $I } from '../Bits/Bits';
import { Maybe, $None, $Some } from '../Maybe/Maybe';
import { Pair, $Pair } from '../Pair/Pair';

// Retrieves and removes a value from the BitMap given a key.
// - m: The BitMap to search in and remove from.
// - k: The Bits key to look up and remove.
// = A pair containing the new BitMap and the value associated with the key (wrapped in Maybe).
export const $take = <A>(m: BitMap<A>, k: Bits): Pair<BitMap<A>, Maybe<A>> => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return $Pair($Node($None, m.lft, m.rgt), m.val);
        case 'O':
          var [new_lft, v] = $take(m.lft, k.tail);
          return $Pair($Node(m.val, new_lft, m.rgt), v);
        case 'I':
          var [new_rgt, v] = $take(m.rgt, k.tail);
          return $Pair($Node(m.val, m.lft, new_rgt), v);
      }
    case 'Leaf':
      return $Pair($Leaf, $None);
  }
};

export const take = <A>(m: BitMap<A>) => (k: Bits) => $take(m, k);
