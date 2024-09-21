import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Tree } from '../../Base/Tree/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';

// Checks if a key exists in the Map.
// - m: The Map to search in.
// - k: The Bits key to look for.
// = True if the key exists in the Map, False otherwise.
export const $contains = <A>(m: Map<A>, k: Bits): Bool => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return m.val.$ === 'Some' ? $True : $False;
        case 'O':
          return $contains(m.lft, k.tail);
        case 'I':
          return $contains(m.rgt, k.tail);
      }
    case 'Leaf':
      return $False;
  }
};

export const contains = <A>(m: Map<A>) => (k: Bits) => $contains(m, k);
