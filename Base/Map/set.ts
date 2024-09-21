import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Bits, $E, $O, $I } from '../../Base/Bits/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';

// Inserts a key-value pair into the Map.
// - m: The Map to insert into.
// - k: The Bits key to insert.
// - v: The value to associate with the key.
// = A new Map with the key-value pair inserted.
export const $set = <A>(m: Map<A>, k: Bits, v: A): Map<A> => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return $Node($Some(v), m.lft, m.rgt);
        case 'O':
          return $Node(m.val, $set(m.lft, k.tail, v), m.rgt);
        case 'I':
          return $Node(m.val, m.lft, $set(m.rgt, k.tail, v));
      }
    case 'Leaf':
      switch (k.$) {
        case 'E':
          return $Node($Some(v), $Leaf, $Leaf);
        case 'O':
          return $Node($None, $set($Leaf, k.tail, v), $Leaf);
        case 'I':
          return $Node($None, $Leaf, $set($Leaf, k.tail, v));
      }
  }
};

export const set = <A>(m: Map<A>) => (k: Bits) => (v: A) => $set(m, k, v);
