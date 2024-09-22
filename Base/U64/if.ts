import { U64 } from '../../Base/U64/Type';
import { Bool } from '../../Base/Bool/Type';
import { Nat } from '../../Base/Nat/Type';
import { $to_nat } from '../../Base/U64/to-nat';

// Conditional expression for U64.
// - n: The U64 condition to evaluate (non-zero is considered true).
// - t: The value to return if the condition is true (non-zero).
// - f: The value to return if the condition is false (zero).
// = Either t or f, depending on the condition.
export const $if_then_else_ = <A>(n: U64, t: A, f: A): A => {
  return $to_nat(n) === 0n ? f : t;
};

export const if_then_else_ = <A>(n: U64) => (t: A) => (f: A) => $if_then_else_(n, t, f);

// NOTE: We use the $to_nat function to convert U64 to Nat,
// then check if it's zero. This preserves the original logic
// while using TypeScript's native types efficiently.