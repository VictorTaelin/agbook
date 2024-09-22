import { List } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';

// Checks if a list is empty.
// - xs: The input list to check.
// = True if the list is empty, False otherwise.
export const $empty = <A>(xs: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $True;
    default:
      return $False;
  }
};

export const empty = <A>(xs: List<A>) => $empty(xs);