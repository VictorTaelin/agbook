import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';
import { Maybe } from '../../Base/Maybe/Type';

// Counts the number of elements in a Map.
// - m: The Map to count elements from.
// = The number of elements in the Map.
export const $count = <A>(m: Map<A>): Nat => {
  switch (m.$) {
    case 'Leaf':
      return $Zero;
    case 'Node':
      var left_count = $count(m.lft);
      var right_count = $count(m.rgt);
      var subtree_count = $add(left_count, right_count);
      switch (m.val.$) {
        case 'None':
          return subtree_count;
        case 'Some':
          return $Succ(subtree_count);
      }
  }
};

export const count = <A>(m: Map<A>) => $count(m);
