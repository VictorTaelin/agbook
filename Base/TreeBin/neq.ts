import { TreeBin } from '../../Base/TreeBin/Type';
import { Bool } from '../../Base/Bool/Type';
import { $not } from '../../Base/Bool/not';
import { $eq } from '../../Base/TreeBin/eq';
import { Eq } from '../../Base/Trait/Eq';

export const $neq = <A>(eq_a: Eq<A>, t1: TreeBin<A>, t2: TreeBin<A>): Bool => {
  return $not($eq(eq_a, t1, t2));
};

export const neq = <A>(eq_a: Eq<A>) => (t1: TreeBin<A>) => (t2: TreeBin<A>): Bool => $neq(eq_a, t1, t2);

// NOTE: Operator omitted: '_!=_'.
