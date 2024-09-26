import { BitMap } from './Type';
import { Maybe, $None } from '../Maybe/Maybe';
import { BinTree } from '../BinTree/BinTree';
import { Bits } from '../Bits/Bits';

// Retrieves a value from the BitMap given a key.
// - m: The BitMap to search in.
// - k: The Bits key to look up.
// = The value associated with the key, wrapped in Maybe.
export const $get = <A>(m: BitMap<A>, k: Bits): Maybe<A> => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return m.val;
        case 'O':
          return $get(m.lft, k.tail);
        case 'I':
          return $get(m.rgt, k.tail);
      }
    case 'Leaf':
      return $None;
  }
};

export const get = <A>(m: BitMap<A>) => (k: Bits) => $get(m, k);
