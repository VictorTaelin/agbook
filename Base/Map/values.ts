import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { List, $Cons, $Nil } from '../../Base/List/Type';
import { $append } from '../../Base/List/append';
import { Maybe } from '../../Base/Maybe/Type';

// Converts a Map to a List of the stored values.
// None values are skipped.
// - m: The input Map.
// = A list with the values stored in the Map.
export const $values = <A>(m: Map<A>): List<A> => {
  switch (m.$) {
    case 'Node':
      switch (m.val.$) {
        case 'None':
          return $append($values(m.lft), $values(m.rgt));
        case 'Some':
          return $Cons(m.val.value, $append($values(m.lft), $values(m.rgt)));
      }
    case 'Leaf':
      return $Nil;
  }
};

export const values = <A>(m: Map<A>) => $values(m);
