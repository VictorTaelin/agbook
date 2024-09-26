import { List, $Nil, $Cons } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { Ord, $lt, $gt } from '../../Base/Trait/Ord';

export const $lte = <A>(O: Ord<A>, xs: List<A>, ys: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $True;
    case '::':
      switch (ys.$) {
        case '[]':
          return $False;
        case '::':
          var x = xs.head;
          var x_xs = xs.tail;
          var y = ys.head;
          var y_ys = ys.tail;
          if ($lt(O, x, y)) {
            return $True;
          } else if ($gt(O, x, y)) {
            return $False;
          } else {
            return $lte(O, x_xs, y_ys);
          }
      }
  }
};

export const lte = <A>(O: Ord<A>) => (xs: List<A>) => (ys: List<A>): Bool => $lte(O, xs, ys);

// NOTE: Operator omitted: '_<=_'.
