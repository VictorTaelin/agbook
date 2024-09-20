import { Nat } from '../../Base/Nat/Type';
import { $if_then_else_ } from '../../Base/Bool/if';
import { $_<=_ } from '../../Base/Nat/Ord';

// Returns the minimum of two natural numbers.
// - x: The first natural number.
// - y: The second natural number.
// = The smaller of x and y.
export const $min = (x: Nat, y: Nat): Nat => $if_then_else_($_<=_(x, y), x, y);
export const  min = (x: Nat) => (y: Nat): Nat => $min(x, y);

// NOTE: Using native Math.min for efficiency.
export const $$min = (x: Nat, y: Nat): Nat => BigInt(Math.min(Number(x), Number(y)));