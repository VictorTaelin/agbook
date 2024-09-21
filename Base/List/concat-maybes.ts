import { Maybe } from '../../Base/Maybe/Type';
import { List, $Cons, $Nil } from '../../Base/List/Type';
import { $foldr } from '../../Base/List/foldr';

// Concatenates all of the `Some` values in a list of Maybe.
// - xs: The input list of Maybe values.
// = A new list containing all the values from `Some` constructors.
export const $concat_maybes = <A>(xs: List<Maybe<A>>): List<A> => {
  const go = (maybe_a: Maybe<A>, acc: List<A>): List<A> => {
    switch (maybe_a.$) {
      case 'None':
        return acc;
      case 'Some':
        return $Cons(maybe_a.value, acc);
    }
  };

  return $foldr(go, $Nil, xs);
};

export const concat_maybes = <A>(xs: List<Maybe<A>>) => $concat_maybes(xs);
