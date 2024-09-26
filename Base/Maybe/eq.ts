import { Maybe } from '../../Base/Maybe/Maybe';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { Eq } from '../../Base/Trait/Eq';

export const $eq = <A>(eq_a: Eq<A>) => (a: Maybe<A>, b: Maybe<A>): Bool => {
  switch (a.$) {
    case 'None':
      return b.$ === 'None' ? $True : $False;
    case 'Some':
      return b.$ === 'Some' ? eq_a.eq(a.value, b.value) : $False;
  }
};

export const eq = <A>(eq_a: Eq<A>) => (a: Maybe<A>) => (b: Maybe<A>): Bool => 
  $eq(eq_a)(a, b);

// NOTE: Operator omitted: '_==_'.
