import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';

// Equality comparison for nats.
// - x: The 1st nat.
// - y: The 2nd nat.
// = True if x is equal to y.
export const $$eq = (x: Nat, y: Nat): Bool => {
  if (x === 0n) {
    if (y === 0n) {
      return true;
    } else {
      return false;
    }
  } else {
    if (y === 0n) {
      return false;
    } else {
      var x_ = x - 1n;
      var y_ = y - 1n;
      return $$eq(x_, y_);
    }
  }
};

// NOTE: Using native BigInt equality for efficiency.
export const $eq = (x: Nat, y: Nat): Bool => x === y;
export const  eq = (x: Nat) => (y: Nat) => x === y;

// NOTE: Operator omitted: '_==_'.