import { List } from '../../Base/List/List';
import { Eq, $eq } from '../../Base/Trait/Eq';
import { Nat, $Zero } from '../../Base/Nat/Nat';
import { $add } from '../../Base/Nat/add';

export const $$count = <A>(eq_a: Eq<A>, x: A, xs: List<A>): Nat => {
  switch (xs.$) {
    case '[]':
      return $Zero;
    case '::':
      return $add(
        $eq(eq_a, x, xs.head) ? 1n : 0n,
        $$count(eq_a, x, xs.tail)
      );
  }
};

// NOTE: Using native loop for efficiency
export const $count = <A>(eq_a: Eq<A>, x: A, xs: List<A>): Nat => {
  var count = 0n;
  var current = xs;
  while (current.$ === '::') {
    if ($eq(eq_a, x, current.head)) {
      count++;
    }
    current = current.tail;
  }
  return count;
};

export const count = <A>(eq_a: Eq<A>) => (x: A) => (xs: List<A>) => $count(eq_a, x, xs);
