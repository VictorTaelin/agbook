import { List } from '../../Base/List/List';
import { Nat, $Zero, $Succ } from '../../Base/Nat/Nat';

// Computes the length of a list.
// - xs: The input list.
// = The number of elements in the list.
export const $length = <A>(xs: List<A>): Nat => {
  switch (xs.$) {
    case '[]':
      return $Zero;
    case '::':
      return $Succ($length(xs.tail));
  }
};

export const length = <A>(xs: List<A>) => $length(xs);

// NOTE: Using native BigInt operations for efficiency
export const $$length = <A>(xs: List<A>): Nat => {
  var len = 0n;
  var current = xs;
  while (current.$ === '::') {
    len += 1n;
    current = current.tail;
  }
  return len;
};
