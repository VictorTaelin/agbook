import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Pair, $Pair } from '../../Base/Pair/Type';

// Swaps a value in the Map for a new value, returning the old value if it existed.
// - m: The Map to swap in.
// - k: The Bits key to swap.
// - v: The new value to insert.
// = A pair containing the new Map and the old value associated with the key (wrapped in Maybe).
export const $swap = <A>(m: Map<A>, k: Bits, v: A): Pair<Map<A>, Maybe<A>> => {
  switch (m.$) {
    case 'Node':
      switch (k.$) {
        case 'E':
          return $Pair($Node($Some(v), m.lft, m.rgt), m.val);
        case 'O':
          var [new_lft, old_val] = $swap(m.lft, k.tail, v);
          return $Pair($Node(m.val, new_lft, m.rgt), old_val);
        case 'I':
          var [new_rgt, old_val] = $swap(m.rgt, k.tail, v);
          return $Pair($Node(m.val, m.lft, new_rgt), old_val);
      }
    case 'Leaf':
      switch (k.$) {
        case 'E':
          return $Pair($Node($Some(v), $Leaf, $Leaf), $None);
        case 'O':
          var [new_lft, old_val] = $swap($Leaf, k.tail, v);
          return $Pair($Node($None, new_lft, $Leaf), old_val);
        case 'I':
          var [new_rgt, old_val] = $swap($Leaf, k.tail, v);
          return $Pair($Node($None, $Leaf, new_rgt), old_val);
      }
  }
};

export const swap = <A>(m: Map<A>) => (k: Bits) => (v: A) => $swap(m, k, v);
