import { Nat } from '../../Base/Nat/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { OrdNat } from '../../Base/Nat/Ord';

// Returns the maximum of two natural numbers.
// - x: The first natural number.
// - y: The second natural number.
// = The larger of x and y.
export const $max = (x: Nat, y: Nat): Nat => {
  return $if_then_else_(OrdNat._>=_(x, y), x, y);
};

export const max = (x: Nat) => (y: Nat) => $max(x, y);

// NOTE: Using native Math.max for efficiency.
export const $$max = (x: Nat, y: Nat): Nat => BigInt(Math.max(Number(x), Number(y)));