import { Maybe } from '../../Base/Maybe/Maybe';
import { Bool } from '../../Base/Bool/Bool';
import { not } from '../../Base/Bool/not';
import { Eq } from '../../Base/Trait/Eq';
import { $eq as $maybe_eq } from '../../Base/Maybe/eq';

export const $neq = <A>(eq_a: Eq<A>) => (x: Maybe<A>, y: Maybe<A>): Bool => 
  not($maybe_eq(eq_a)(x, y));

export const neq = <A>(eq_a: Eq<A>) => (x: Maybe<A>) => (y: Maybe<A>): Bool => 
  $neq(eq_a)(x, y);

// NOTE: Operator omitted: '_!=_'.
