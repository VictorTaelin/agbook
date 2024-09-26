import { BitMap, $Node, $Leaf } from './BitMap';
import { List, $Cons, $Nil } from '../List/List';
import { $append } from '../List/append';
import { Maybe } from '../Maybe/Maybe';

// Converts a BitMap to a List of the stored values.
// None values are skipped.
// - m: The input BitMap.
// = A list with the values stored in the BitMap.
export const $values = <A>(m: BitMap<A>): List<A> => {
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

export const values = <A>(m: BitMap<A>) => $values(m);
