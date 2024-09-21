import { List } from '../../Base/List/Type';
import { Bool } from '../../Base/Bool/Type';
import { $not } from '../../Base/Bool/not';
import { Eq } from '../../Base/Trait/Eq';
import { $eq } from '../../Base/List/eq';

export const $neq = <A>(eq_a: Eq<A>) => (xs: List<A>, ys: List<A>): Bool => 
  $not($eq(eq_a)(xs, ys));

export const neq = <A>(eq_a: Eq<A>) => (xs: List<A>) => (ys: List<A>): Bool => 
  $neq(eq_a)(xs, ys);

// NOTE: Operator omitted: '_!=_'.
