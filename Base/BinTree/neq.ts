import { BinTree } from '../../Base/BinTree/BinTree';
import { Bool } from '../../Base/Bool/Bool';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/BinTree/eq';
import { Eq } from '../../Base/Trait/Eq';

// Checks if two binary trees are not equal.
// 1st: The equality function for type A.
// 2nd: The first tree to compare.
// 3rd: The second tree to compare.
// = True if the trees are not equal, False otherwise.
export const $neq = <A>(eq_a: Eq<A>, t1: BinTree<A>, t2: BinTree<A>): Bool => {
  return $not($eq(eq_a, t1, t2));
};

export const neq = <A>(eq_a: Eq<A>) => (t1: BinTree<A>) => (t2: BinTree<A>): Bool => $neq(eq_a, t1, t2);
