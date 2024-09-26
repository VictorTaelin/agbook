import { Nat } from '../../Base/Nat/Nat';
import { $if_then_else_ } from '../../Base/Bool/if';
import { OrdNat } from '../../Base/Nat/Trait/Ord';
import { $lte } from '../../Base/Trait/Ord';

// Returns the minimum of two natural numbers.
// - x: The first natural number.
// - y: The second natural number.
// = The smaller of x and y.
export const $min = (x: Nat, y: Nat): Nat => {
  return $if_then_else_($lte(OrdNat, x, y), x, y);
};

export const min = (x: Nat) => (y: Nat) => $min(x, y);

// NOTE: Using native Math.min for efficiency.
export const $$min = (x: Nat, y: Nat): Nat => BigInt(Math.min(Number(x), Number(y)));
