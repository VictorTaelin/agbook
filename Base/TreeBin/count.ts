import { TreeBin } from '../../Base/TreeBin/Type';
import { Bool } from '../../Base/Bool/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { Nat, $Zero } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';
import { Eq, $eq } from '../../Base/Trait/Eq';

export const $count = <A>(eq_a: Eq<A>, x: A, tree: TreeBin<A>): Nat => {
  switch (tree.$) {
    case 'Leaf':
      return $Zero;
    case 'Node':
      var count_if_equal = $if_then_else_($eq(eq_a, x, tree.val), 1n, 0n);
      var count_left = $count(eq_a, x, tree.lft);
      var count_right = $count(eq_a, x, tree.rgt);
      return $add($add(count_if_equal, count_left), count_right);
  }
};

export const count = <A>(eq_a: Eq<A>) => (x: A) => (tree: TreeBin<A>) => $count(eq_a, x, tree);
