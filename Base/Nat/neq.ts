import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

export const $$neq = (m: Nat, n: Nat): Bool => {
  if (m === 0n) {
    if (n === 0n) {
      return false;
    } else {
      return true;
    }
  } else {
    var m_ = m - 1n;
    if (n === 0n) {
      return true;
    } else {
      var n_ = n - 1n;
      return $$neq(m_, n_);
    }
  }
};

// NOTE: Using native BigInt inequality for efficiency
export const $neq = (m: Nat, n: Nat): Bool => m !== n;
export const  neq = (m: Nat) => (n: Nat) => m !== n;

// NOTE: Operator omitted: '_!=_'.
