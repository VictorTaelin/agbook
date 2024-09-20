import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

export const $$eq = (m: Nat, n: Nat): Bool => {
  if (m === 0n) {
    if (n === 0n) {
      return true;
    } else {
      return false;
    }
  } else {
    if (n === 0n) {
      return false;
    } else {
      var m_ = m - 1n;
      var n_ = n - 1n;
      return $$eq(m_, n_);
    }
  }
};

// NOTE: Using native BigInt equality for efficiency
export const $eq = (m: Nat, n: Nat): Bool => m === n;
export const  eq = (m: Nat) => (n: Nat) => m === n;

// NOTE: Operator omitted: '_==_'.
