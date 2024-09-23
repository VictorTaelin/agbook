import { U64 } from '../../Base/U64/Type';
import { $div } from '../../Base/U64/div';
import { $mul } from '../../Base/U64/mul';
import { $sub } from '../../Base/U64/sub';

// Modulo operation for two U64 numbers.
// - a: The dividend (U64 number).
// - b: The divisor (U64 number).
// = The remainder of a divided by b as a U64 number.
export const $$mod = (a: U64, b: U64): U64 => {
  return $sub(a, $mul(b, $div(a, b)));
};

// NOTE: Using native BigInt modulo for efficiency
export const $mod = (a: U64, b: U64): U64 => {
  if (b === 0n) {
    throw new Error("Modulo by zero");
  }
  return BigInt.asUintN(64, a % b);
};

export const mod = (a: U64) => (b: U64) => $mod(a, b);

// NOTE: Operator omitted: '_mod_'.