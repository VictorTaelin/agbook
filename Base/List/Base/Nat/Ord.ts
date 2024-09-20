import { Nat } from '../../Base/Nat/Type';
import { Bool } from '../../Base/Bool/Type';
import { Ord } from '../../Base/Trait/Ord';

// Implementation of Ord trait for Nat
export const OrdNat: Ord<Nat> = {
  _<_: (x: Nat, y: Nat): Bool => x < y,
  _<=_: (x: Nat, y: Nat): Bool => x <= y,
  _>_: (x: Nat, y: Nat): Bool => x > y,
  _>=_: (x: Nat, y: Nat): Bool => x >= y
};

// NOTE: Using native BigInt comparison operations for efficiency.

// Less than
export const $_<_ = (x: Nat, y: Nat): Bool => x < y;
export const  _<_ = (x: Nat) => (y: Nat): Bool => x < y;

// Less than or equal
export const $_<=_ = (x: Nat, y: Nat): Bool => x <= y;
export const  _<=_ = (x: Nat) => (y: Nat): Bool => x <= y;

// Greater than
export const $_>_ = (x: Nat, y: Nat): Bool => x > y;
export const  _>_ = (x: Nat) => (y: Nat): Bool => x > y;

// Greater than or equal
export const $_>=_ = (x: Nat, y: Nat): Bool => x >= y;
export const  _>=_ = (x: Nat) => (y: Nat): Bool => x >= y;