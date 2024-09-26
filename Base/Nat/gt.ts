import { Nat } from '../../Base/Nat/Nat';
import { Bool, True, False } from '../../Base/Bool/Bool';

export const $$gt = (x: Nat, y: Nat): Bool => {
  if (x === 0n) {
    return False;
  } else if (y === 0n) {
    return True;
  } else {
    var x_ = x - 1n;
    var y_ = y - 1n;
    return $$gt(x_, y_);
  }
};

// NOTE: Using native BigInt comparison for efficiency
export const $gt = (x: Nat, y: Nat): Bool => x > y;
export const  gt = (x: Nat) => (y: Nat) => x > y;

// NOTE: Operator omitted: '_>_'
