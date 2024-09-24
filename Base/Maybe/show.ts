import { Maybe } from '../../Base/Maybe/Type';
import { String } from '../../Base/String/Type';
import { $append } from '../../Base/String/append';
import { Show } from '../../Base/Trait/Show';

export const $show = <A>(show_a: Show<A>, ma: Maybe<A>): String => {
  switch (ma.$) {
    case 'None':
      return "None";
    case 'Some':
      return $append($append("Some(", show_a.to_string(ma.value)), ")");
  }
};

export const show = <A>(show_a: Show<A>) => (ma: Maybe<A>) => $show(show_a, ma);
