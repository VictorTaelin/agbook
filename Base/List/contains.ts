import { List } from '../../Base/List/Type';
import { Bool, $True, $False } from '../../Base/Bool/Type';
import { Eq } from '../../Base/Trait/Eq';

// Checks if an element is contained in the list.
// - eq_a: The equality function for type A.
// - x: The element to search for.
// - xs: The list to search in.
// = True if x is in xs, False otherwise.
export const $contains = <A>(eq_a: Eq<A>, x: A, xs: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $False;
    case '::':
      return eq_a.eq(x, xs.head) ? $True : $contains(eq_a, x, xs.tail);
  }
};

export const contains = <A>(eq_a: Eq<A>) => (x: A) => (xs: List<A>): Bool => 
  $contains(eq_a, x, xs);
