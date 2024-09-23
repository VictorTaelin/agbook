import { BitMap, $Node, $Leaf } from './Type';
import { Maybe } from '../Maybe/Type';
import { String } from '../String/Type';
import { $append } from '../String/append';

export const $show = <A>(f: (a: A) => String, map: BitMap<A>): String => {
  switch (map.$) {
    case 'Leaf':
      return "_";
    case 'Node':
      switch (map.val.$) {
        case 'None':
          return $append("#[", $append($show(f, map.lft), $append(" ", $append($show(f, map.rgt), "]"))));
        case 'Some':
          return $append("#", $append(f(map.val.value), $append("[", $append($show(f, map.lft), $append(" ", $append($show(f, map.rgt), "]"))))));
      }
  }
};

export const show = <A>(f: (a: A) => String) => (map: BitMap<A>) => $show(f, map);
