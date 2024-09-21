import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { Ord, $gt, $lt } from '../../Base/Trait/Ord';

export const $gte = <A>(O: Ord<A>, xs: List<A>, ys: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      switch (ys.$) {
        case '[]':
          return $True;
        case '::':
          return $False;
      }
    case '::':
      switch (ys.$) {
        case '[]':
          return $True;
        case '::':
          var x = xs.head;
          var x_xs = xs.tail;
          var y = ys.head;
          var y_ys = ys.tail;
          if ($gt(O, x, y)) {
            return $True;
          } else if ($lt(O, x, y)) {
            return $False;
          } else {
            return $gte(O, x_xs, y_ys);
          }
      }
  }
};

export const gte = <A>(O: Ord<A>) => (xs: List<A>) => (ys: List<A>) => $gte(O, xs, ys);

// NOTE: Operator omitted: '_>=_'.
