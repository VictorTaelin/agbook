import { List } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';

// Checks if a list is non-empty (cons).
// - xs: The list to check.
// = True if the list is non-empty, False otherwise.
export const $is_cons = <A>(xs: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $False;
    case '::':
      return $True;
  }
};

export const is_cons = <A>(xs: List<A>) => $is_cons(xs);