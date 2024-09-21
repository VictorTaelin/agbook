import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { Pair, $Pair } from '../../Base/Pair/Type';
import { $case_of_ } from '../../Base/Function/case';

// Splits a list at the first element that satisfies the given predicate.
// - pred: A predicate function that determines where to split the list.
// - xs: The input list.
// = A pair of lists: the part before the split element and the part after (excluding the split element).
export const $split = <A>(pred: (a: A) => Bool, xs: List<A>): Pair<List<A>, List<A>> => {
  switch (xs.$) {
    case '[]':
      return $Pair($Nil, $Nil);
    case '::':
      return $case_of_(pred(xs.head), (result: Bool) => {
        if (result) {
          return $Pair($Nil, xs.tail);
        } else {
          var split_result = $split(pred, xs.tail);
          return $Pair($Cons(xs.head, split_result[0]), split_result[1]);
        }
      });
  }
};

export const split = <A>(pred: (a: A) => Bool) => (xs: List<A>) => $split(pred, xs);
