import { Bits, $O, $I, $E } from '../Bits/Bits';
import { $reverse } from '../Bits/reverse';
import { List, $Nil, $Cons } from '../List/List';
import { $append } from '../List/append';
import { BitMap, $Node, $Leaf } from './Type';
import { Maybe } from '../Maybe/Maybe';
import { Pair, $Pair } from '../Pair/Pair';

// Helper function to traverse the BitMap and accumulate pairs
const to_list_helper = <A>(m: BitMap<A>, acc: Bits): List<Pair<Bits, A>> => {
  switch (m.$) {
    case 'Node':
      const lft_result = to_list_helper(m.lft, $O(acc));
      const rgt_result = to_list_helper(m.rgt, $I(acc));
      const combined = $append(lft_result, rgt_result);
      switch (m.val.$) {
        case 'None':
          return combined;
        case 'Some':
          return $Cons($Pair($reverse(acc), m.val.value), combined);
      }
    case 'Leaf':
      return $Nil;
  }
};

// Converts a BitMap to a List of Bits, A pairs.
// The Bits represent the path to each element in the BitMap.
// None values are skipped.
// - m: The input BitMap.
// = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
export const $to_list = <A>(m: BitMap<A>): List<Pair<Bits, A>> => {
  return to_list_helper(m, $E);
};

export const to_list = <A>(m: BitMap<A>) => $to_list(m);
