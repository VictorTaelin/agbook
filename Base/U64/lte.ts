import { U64 } from '../../Base/U64/Type';
import { Bool } from '../../Base/Bool/Type';
import { $lte as nat_lte } from '../../Base/Nat/lte';
import { $to_nat } from '../../Base/U64/to-nat';

export const $$lte = (x: U64, y: U64): Bool => {
  return nat_lte($to_nat(x), $to_nat(y));
};

// NOTE: Using native BigInt comparison for efficiency
export const $lte = (x: U64, y: U64): Bool => x <= y;
export const  lte = (x: U64) => (y: U64) => x <= y;

// NOTE: Operator omitted: '_<=_'