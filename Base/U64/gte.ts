import { U64 } from '../../Base/U64/U64';
import { Bool } from '../../Base/Bool/Bool';
import { $gte as nat_gte } from '../../Base/Nat/gte';
import { $to_nat } from '../../Base/U64/to-nat';

export const $$gte = (x: U64, y: U64): Bool => {
  return nat_gte($to_nat(x), $to_nat(y));
};

// NOTE: Using native BigInt comparison for efficiency
export const $gte = (x: U64, y: U64): Bool => x >= y;
export const  gte = (x: U64) => (y: U64) => x >= y;

// NOTE: Operator omitted: '_>=_'