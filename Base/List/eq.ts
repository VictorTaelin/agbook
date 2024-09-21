import { List, $Nil, $Cons } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { $and } from '../../Base/Bool/and';
import { Eq } from '../../Base/Trait/Eq';

export const $eq = <A>(eq_a: Eq<A>) => (xs: List<A>, ys: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      switch (ys.$) {
        case '[]':
          return $True;
        default:
          return $False;
      }
    case '::':
      switch (ys.$) {
        case '::':
          return $and(eq_a.eq(xs.head, ys.head), $eq(eq_a)(xs.tail, ys.tail));
        default:
          return $False;
      }
  }
};

export const eq = <A>(eq_a: Eq<A>) => (xs: List<A>) => (ys: List<A>): Bool => 
  $eq(eq_a)(xs, ys);

// NOTE: Operator omitted: '_==_'.
