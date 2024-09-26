import { List, $Cons, $Nil } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';
import { Ord, $lt as $ord_lt, $gt as $ord_gt } from '../../Base/Trait/Ord';

export const $lt = <A>(O: Ord<A>, xs: List<A>, ys: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      switch (ys.$) {
        case '[]':
          return $False;
        case '::':
          return $True;
      }
    case '::':
      switch (ys.$) {
        case '[]':
          return $False;
        case '::':
          var x_lt_y = $ord_lt(O, xs.head, ys.head);
          if (x_lt_y) {
            return $True;
          } else {
            var x_gt_y = $ord_gt(O, xs.head, ys.head);
            if (x_gt_y) {
              return $False;
            } else {
              return $lt(O, xs.tail, ys.tail);
            }
          }
      }
  }
};

export const lt = <A>(O: Ord<A>) => (xs: List<A>) => (ys: List<A>): Bool => $lt(O, xs, ys);

// NOTE: Operator omitted: '_<_'.