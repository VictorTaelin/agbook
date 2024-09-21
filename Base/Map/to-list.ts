import { Bits, $O, $I, $E } from '../../Base/Bits/Type';
import { $reverse } from '../../Base/Bits/reverse';
import { List, $Nil, $Cons } from '../../Base/List/Type';
import { $append } from '../../Base/List/append';
import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Maybe } from '../../Base/Maybe/Type';
import { Pair, $Pair } from '../../Base/Pair/Type';

// Helper function to traverse the Map and accumulate pairs
const to_list_helper = <A>(m: Map<A>, acc: Bits): List<Pair<Bits, A>> => {
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

// Converts a Map to a List of Bits, A pairs.
// The Bits represent the path to each element in the Map.
// None values are skipped.
// - m: The input Map.
// = A List of Pairs, where each Pair contains the Bits path and the corresponding value.
export const $to_list = <A>(m: Map<A>): List<Pair<Bits, A>> => {
  return to_list_helper(m, $E);
};

export const to_list = <A>(m: Map<A>) => $to_list(m);
