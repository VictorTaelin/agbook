import { BitMap, $Node, $Leaf } from './Type';
import { Bits, $O, $I, $E } from '../Bits/Bits';
import { Maybe, $Some, $None } from '../Maybe/Maybe';
import { Pair, $Pair } from '../Pair/Pair';

// Swaps a value in the BitMap for a new value, returning the old value if it existed.
// - m: The BitMap to swap in.
// - k: The Bits key to swap.
// - v: The new value to insert.
// = A pair containing the new BitMap and the old value associated with the key (wrapped in Maybe).
export const $swap = <A>(m: BitMap<A>, k: Bits, v: A): Pair<BitMap<A>, Maybe<A>> => {
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

export const swap = <A>(m: BitMap<A>) => (k: Bits) => (v: A) => $swap(m, k, v);
