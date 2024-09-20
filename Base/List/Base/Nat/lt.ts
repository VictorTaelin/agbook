import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

// Less-than comparison for nats.
// - x: The 1st nat.
// - y: The 2nd nat.
// = True if x is less than y.
export const $$lt = (x: Nat, y: Nat): Bool => {
  if (x === 0n) {
    if (y === 0n) {
      return false;
    } else {
      return true;
    }
  } else {
    if (y === 0n) {
      return false;
    } else {
      var x_ = x - 1n;
      var y_ = y - 1n;
      return $$lt(x_, y_);
    }
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $lt = (x: Nat, y: Nat): Bool => x < y;
export const  lt = (x: Nat) => (y: Nat) => x < y;

// NOTE: Operator omitted: '_<_'.