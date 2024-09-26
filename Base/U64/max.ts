import { U64 } from '../../Base/U64/U64';
import { OrdU64 } from '../../Base/U64/Trait/Ord';
import { $if_then_else_ } from '../../Base/U64/if';
import { $from_bool } from '../../Base/U64/from-bool';
import { $gte } from '../../Base/Trait/Ord';

// Maximum of two U64 numbers.
// - x: The first U64 number.
// - y: The second U64 number.
// = The larger of x and y as a U64 number.
export const $$max = (x: U64, y: U64): U64 => {
  return $if_then_else_($from_bool($gte(OrdU64, x, y)), x, y);
};

// NOTE: Using native Math.max for efficiency
export const $max = (x: U64, y: U64): U64 => BigInt(Math.max(Number(x), Number(y)));
export const  max = (x: U64) => (y: U64) => $max(x, y);