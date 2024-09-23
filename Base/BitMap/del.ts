import { BitMap, $Node, $Leaf } from './Type';
import { Bits, $E, $O, $I } from '../Bits/Type';
import { Maybe, $None } from '../Maybe/Type';

// Removes a key-value pair from the BitMap.
// - m: The BitMap to remove from.
// - k: The Bits key to remove.
// = A new BitMap with the key-value pair removed.
export const $del = <A>(m: BitMap<A>, k: Bits): BitMap<A> => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return $Node($None, m.lft, m.rgt);
        case 'O':
          return $Node(m.val, $del(m.lft, k.tail), m.rgt);
        case 'I':
          return $Node(m.val, m.lft, $del(m.rgt, k.tail));
      }
    case 'Leaf':
      return $Leaf;
  }
};

export const del = <A>(m: BitMap<A>) => (k: Bits) => $del(m, k);
