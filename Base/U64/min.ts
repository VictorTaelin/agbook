import { U64 } from '../../Base/U64/U64';
import { OrdU64 } from '../../Base/U64/Trait/Ord';
import { $if_then_else_ } from '../../Base/U64/if';
import { $from_bool } from '../../Base/U64/from-bool';
import { $lte } from '../../Base/Trait/Ord';

// Minimum of two U64 numbers.
// - x: The first U64 number.
// - y: The second U64 number.
// = The smaller of x and y as a U64 number.
export const $min = (x: U64, y: U64): U64 => {
  return $if_then_else_($from_bool($lte(OrdU64, x, y)), x, y);
};

export const min = (x: U64) => (y: U64) => $min(x, y);

// NOTE: For efficiency, we can use native BigInt comparison
export const $$min = (x: U64, y: U64): U64 => {
  return x <= y ? x : y;
};