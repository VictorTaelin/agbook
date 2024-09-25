import { BinTree } from '../../Base/BinTree/Type';
import { Nat, Zero } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';

// Calculates the sum of all values in a tree of natural numbers.
// 1st: The tree to sum.
// = The sum of all values in the tree.
export const $sum = (t: BinTree<Nat>): Nat => {
  switch (t.$) {
    case 'Leaf':
      return Zero;
    case 'Node':
      return $add(t.val, $add($sum(t.lft), $sum(t.rgt)));
  }
};

export const sum = (t: BinTree<Nat>) => $sum(t);
