import { Map } from '../../Base/Map/Type';
import { Maybe, $None } from '../../Base/Maybe/Type';
import { TreeBin } from '../../Base/TreeBin/Type';
import { Bits } from '../../Base/Bits/Type';

// Retrieves a value from the Map given a key.
// - m: The Map to search in.
// - k: The Bits key to look up.
// = The value associated with the key, wrapped in Maybe.
export const $get = <A>(m: Map<A>, k: Bits): Maybe<A> => {
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

export const get = <A>(m: Map<A>) => (k: Bits) => $get(m, k);
