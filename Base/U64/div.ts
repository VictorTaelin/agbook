import { U64 } from '../../Base/U64/Type';
import { OrdU64 } from '../../Base/U64/Trait/Ord';
import { Bool } from '../../Base/Bool/Type';
import { Nat } from '../../Base/Nat/Type';
import { $if_then_else_ } from '../../Base/U64/if';
import { $min } from '../../Base/U64/min';
import { $from_bool } from '../../Base/U64/from-bool';
import { $lte } from '../../Base/Trait/Ord';
import { $to_nat } from '../../Base/U64/to-nat';
import { $from_nat } from '../../Base/U64/from-nat';

// Division function for U64 (64-bit unsigned integers)
export const $$div = (x: U64, y: U64): U64 => {
  const go = (m: Nat, n: Nat): Nat => {
    if (m === 0n || n === 0n) {
      return 0n;
    } else {
      return $if_then_else_(
        $from_bool($lte(OrdU64, $from_nat(m), $from_nat(n))),
        0n,
        1n + go($to_nat($min($from_nat(m), $from_nat(n))), n)
      );
    }
  };

  return $from_nat(go($to_nat(x), $to_nat(y)));
};

// NOTE: Using native BigInt division for efficiency
export const $div = (x: U64, y: U64): U64 => {
  if (y === 0n) {
    throw new Error("Division by zero");
  }
  return x / y;
};

export const div = (x: U64) => (y: U64) => $div(x, y);

// NOTE: Operator omitted: '_/_'.