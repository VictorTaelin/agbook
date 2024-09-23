import { List } from '../../Base/List/Type';
import { Bool, $True } from '../../Base/Bool/Type';
import { $and } from '../../Base/Bool/and';
import { Eq, $eq } from '../../Base/Trait/Eq';

export const $all_equal = <A>(eq_a: Eq<A>, xs: List<A>): Bool => {
  switch (xs.$) {
    case '[]':
      return $True;
    case '::':
      if (xs.tail.$ === '[]') {
        return $True;
      } else {
        return $and($eq(eq_a, xs.head, xs.tail.head), $all_equal(eq_a, xs.tail));
      }
  }
};

export const all_equal = <A>(eq_a: Eq<A>) => (xs: List<A>): Bool => $all_equal(eq_a, xs);
