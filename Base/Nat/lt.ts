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
    var pred_x = x - 1n;
    if (y === 0n) {
      return false;
    } else {
      var pred_y = y - 1n;
      return $$lt(pred_x, pred_y);
    }
  }
};

// NOTE: Using native BigInt comparison for efficiency.
export const $lt = (x: Nat, y: Nat): Bool => x < y;
export const  lt = (x: Nat) => (y: Nat) => x < y;
