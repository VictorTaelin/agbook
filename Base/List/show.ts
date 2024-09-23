import { List, $Cons, $Nil } from '../../Base/List/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { Show } from '../../Base/Trait/Show';

export const $show = <A>(show_a: Show<A>, xs: List<A>): String => {
  const show_rest = (ys: List<A>): String => {
    switch (ys.$) {
      case '[]':
        return ']';
      case '::':
        return $append(', ', $append(show_a.to_string(ys.head), show_rest(ys.tail)));
    }
  };

  switch (xs.$) {
    case '[]':
      return '[]';
    case '::':
      return $append('[', $append(show_a.to_string(xs.head), show_rest(xs.tail)));
  }
};

export const show = <A>(show_a: Show<A>) => (xs: List<A>) => $show(show_a, xs);