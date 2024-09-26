import { List, $Nil, $Cons } from '../../Base/List/List';
import { $map } from '../../Base/List/map';
import { $singleton } from '../../Base/List/singleton';

// Returns all initial segments of a list, shortest first.
// - xs: The input list.
// = A list of lists, containing all initial segments of xs.
export const $inits = <A>(xs: List<A>): List<List<A>> => {
  const tail = (xs: List<A>): List<List<A>> => {
    switch (xs.$) {
      case '[]':
        return $Nil;
      case '::':
        return $Cons(
          $singleton(xs.head),
          $map(
            (ys: List<A>) => $Cons(xs.head, ys),
            tail(xs.tail)
          )
        );
    }
  };

  return $Cons($Nil, tail(xs));
};

export const inits = <A>(xs: List<A>) => $inits(xs);
