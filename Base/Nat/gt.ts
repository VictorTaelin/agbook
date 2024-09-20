import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

// Greater-than comparison for nats.
// - x: The 1st nat.
// - y: The 2nd nat.
// = True if x is greater than y.
export const $$gt = (x: Nat, y: Nat): Bool => {
  if (x === 0n) {
    return false;
  } else if (y === 0n) {
    return true;
  } else {
    var x_ = x - 1n;
    var y_ = y - 1n;
    return $gt(x_, y_);
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $gt = (x: Nat, y: Nat): Bool => x > y;
export const  gt = (x: Nat) => (y: Nat) => x > y;
