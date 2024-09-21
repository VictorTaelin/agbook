import { Map, $Node, $Leaf } from '../../Base/Map/Type';
import { Maybe } from '../../Base/Maybe/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';

export const $show = <A>(f: (a: A) => String, map: Map<A>): String => {
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

export const show = <A>(f: (a: A) => String) => (map: Map<A>) => $show(f, map);
