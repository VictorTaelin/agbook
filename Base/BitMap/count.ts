import { BitMap, $Node, $Leaf } from './Type';
import { Nat, $Zero, $Succ } from '../Nat/Nat';
import { $add } from '../Nat/add';
import { Maybe } from '../Maybe/Maybe';

// Counts the number of elements in a BitMap.
// - m: The BitMap to count elements from.
// = The number of elements in the BitMap.
export const $count = <A>(m: BitMap<A>): Nat => {
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

export const count = <A>(m: BitMap<A>) => $count(m);
