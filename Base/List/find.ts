import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Maybe, $Some, $None } from '../../Base/Maybe/Type';
import { Bool } from '../../Base/Bool/Type';

// Finds the first element in a list that satisfies a given predicate.
// - pred: The predicate function to test elements.
// - xs: The input list to search.
// = Some x if an element x satisfying the predicate is found,
//   None if no such element exists in the list.
export const $find = <A>(pred: (a: A) => Bool, xs: List<A>): Maybe<A> => {
  switch (xs.$) {
    case '[]':
      return $None;
    case '::':
      if (pred(xs.head)) {
        return $Some(xs.head);
      } else {
        return $find(pred, xs.tail);
      }
  }
};

export const find = <A>(pred: (a: A) => Bool) => (xs: List<A>) => $find(pred, xs);