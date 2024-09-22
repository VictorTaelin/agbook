import { Bool, $True } from '../../Base/Bool/Type';
import { $and } from '../../Base/Bool/and';
import { List } from '../../Base/List/Type';
import { $foldr } from '../../Base/List/foldr';
import { Nat } from '../../Base/Nat/Type';
import { OrdNat } from '../../Base/Nat/Trait/Ord';

// Checks if a list of Nats is in ascending order.
// - xs: The list of Nats to check.
// = True if the list is in ascending order, False otherwise.
export const $is_asc = (xs: List<Nat>): Bool => {
  switch (xs.$) {
    case '[]':
      return $True;
    case '::':
      return $foldr(
        (x: Nat, acc: (l: Nat) => Bool) => (l: Nat) => $and(OrdNat.lte(l, x), acc(x)),
        (x: Nat) => $True,
        xs.tail
      )(0n);
  }
};

export const is_asc = (xs: List<Nat>) => $is_asc(xs);