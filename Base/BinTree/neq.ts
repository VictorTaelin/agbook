import { BinTree } from '../../Base/BinTree/Type';
import { Bool } from '../../Base/Bool/Type';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/BinTree/eq';
import { Eq } from '../../Base/Trait/Eq';

export const $neq = <A>(eq_a: Eq<A>, t1: BinTree<A>, t2: BinTree<A>): Bool => {
  return $not($eq(eq_a, t1, t2));
};

export const neq = <A>(eq_a: Eq<A>) => (t1: BinTree<A>) => (t2: BinTree<A>): Bool => $neq(eq_a, t1, t2);

// NOTE: Operator omitted: '_!=_'.
