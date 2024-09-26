import { BinTree } from '../../Base/BinTree/BinTree';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { $and } from '../../Base/Bool/and';
import { Eq } from '../../Base/Trait/Eq';

// Checks if two binary trees are equal.
// 1st: The equality function for type A.
// 2nd: The first tree to compare.
// 3rd: The second tree to compare.
// = True if the trees are equal, False otherwise.
export const $eq = <A>(eq_a: Eq<A>, a: BinTree<A>, b: BinTree<A>): Bool => {
  switch (a.$) {
    case 'Leaf':
      switch (b.$) {
        case 'Leaf':
          return $True;
        default:
          return $False;
      }
    case 'Node':
      switch (b.$) {
        case 'Node':
          return $and(
            eq_a.eq(a.val, b.val),
            $and($eq(eq_a, a.lft, b.lft), $eq(eq_a, a.rgt, b.rgt)));
        default:
          return $False;
      }
  }
};

export const eq = <A>(eq_a: Eq<A>) => (a: BinTree<A>) => (b: BinTree<A>): Bool => $eq(eq_a, a, b);
