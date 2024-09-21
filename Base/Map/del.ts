import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Bits, $E, $O, $I } from '../../Base/Bits/Type';
import { Maybe, $None } from '../../Base/Maybe/Type';

// Removes a key-value pair from the Map.
// - m: The Map to remove from.
// - k: The Bits key to remove.
// = A new Map with the key-value pair removed.
export const $del = <A>(m: Map<A>, k: Bits): Map<A> => {
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

export const del = <A>(m: Map<A>) => (k: Bits) => $del(m, k);
