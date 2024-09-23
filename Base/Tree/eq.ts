import { Tree } from '../../Base/Tree/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $and } from '../../Base/Bool/and';
import { Eq } from '../../Base/Trait/Eq';

export const $eq = <A>(eq_a: Eq<A>, a: Tree<A>, b: Tree<A>): Bool => {
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

export const eq = <A>(eq_a: Eq<A>) => (a: Tree<A>) => (b: Tree<A>): Bool => $eq(eq_a, a, b);

// NOTE: Operator omitted: '_==_'.
