import { List, $Cons, $Nil } from '../../Base/List/Type';
import { Eq, $eq } from '../../Base/Trait/Eq';
import { $if_then_else_ } from '../../Base/Bool/if';
import { Nat, $Zero } from '../../Base/Nat/Type';
import { $add } from '../../Base/Nat/add';

export const $$count = <A>(eq_a: Eq<A>, x: A, xs: List<A>): Nat => {
  switch (xs.$) {
    case '[]':
      return $Zero;
    case '::':
      return $add(
        $if_then_else_($eq(eq_a)(x, xs.head), 1n, 0n),
        $$count(eq_a, x, xs.tail)
      );
  }
};

export const $count = <A>(eq_a: Eq<A>, x: A, xs: List<A>): Nat => {
  switch (xs.$) {
    case '[]':
      return $Zero;
    case '::':
      return $add(
        $if_then_else_($eq(eq_a)(x, xs.head), 1n, 0n),
        $count(eq_a, x, xs.tail)
      );
  }
};

export const count = <A>(eq_a: Eq<A>) => (x: A) => (xs: List<A>) => $count(eq_a, x, xs);
