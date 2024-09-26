import { BitMap, $Node, $Leaf } from './Type';
import { Bits, $O, $I, $E } from '../Bits/Bits';
import { Maybe, $Some, $None } from '../Maybe/Maybe';
import { BinTree } from '../BinTree/BinTree';
import { Bool, $True, $False } from '../Bool/Bool';

// Checks if a key exists in the BitMap.
// - m: The BitMap to search in.
// - k: The Bits key to look for.
// = True if the key exists in the BitMap, False otherwise.
export const $contains = <A>(m: BitMap<A>, k: Bits): Bool => {
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

export const contains = <A>(m: BitMap<A>) => (k: Bits) => $contains(m, k);
