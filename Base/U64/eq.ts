import { U64 } from '../../Base/U64/Type';
import { Bool } from '../../Base/Bool/Type';
import { $eq as nat_eq } from '../../Base/Nat/eq';
import { $to_nat } from '../../Base/U64/to-nat';

// Compares two U64 values for equality
export const $$eq = (x: U64, y: U64): Bool => {
  return nat_eq(to_nat(x), to_nat(y));
};

// NOTE: Using native BigInt equality for efficiency
export const $eq = (x: U64, y: U64): Bool => x === y;
export const  eq = (x: U64) => (y: U64) => x === y;

// NOTE: Operator omitted: '_==_'.

Base/U64/eq.ts:8:17 - error TS2552: Cannot find name 'to_nat'. Did you mean '$to_nat'?

8   return nat_eq(to_nat(x), to_nat(y));
                  ~~~~~~

Base/U64/eq.ts:8:28 - error TS2552: Cannot find name 'to_nat'. Did you mean '$to_nat'?

8   return nat_eq(to_nat(x), to_nat(y));
                             ~~~~~~


Found 2 errors in the same file, starting at: Base/U64/eq.ts:8
