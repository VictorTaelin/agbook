import { List, $Cons, $Nil } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { Ord } from '../../Base/Trait/Ord';

export const $gt = <A>(O: Ord<A>, xs: List<A>, ys: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      switch (ys.$) {
        case '[]':
          return $False;
        case '::':
          return $False;
      }
    case '::':
      switch (ys.$) {
        case '[]':
          return $True;
        case '::':
          var x_gt_y = O.gt(xs.head, ys.head);
          if (x_gt_y) {
            return $True;
          } else {
            var x_lt_y = O.lt(xs.head, ys.head);
            if (x_lt_y) {
              return $False;
            } else {
              return $gt(O, xs.tail, ys.tail);
            }
          }
      }
  }
};

export const gt = <A>(O: Ord<A>) => (xs: List<A>) => (ys: List<A>) => $gt(O, xs, ys);

// NOTE: Operator omitted: '_>_'.
