import { List } from '../../Base/List/List';
import { Bool, $True, $False } from '../../Base/Bool/Bool';

// Checks if a list is empty (nil).
// - xs: The list to check.
// = True if the list is empty, False otherwise.
export const $is_nil = <A>(xs: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $True;
    case '::':
      return $False;
  }
};

export const is_nil = <A>(xs: List<A>) => $is_nil(xs);