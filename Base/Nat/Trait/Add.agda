module Base.Nat.Trait.Add where

open import Base.Nat.Type
open import Base.Trait.Add
import Base.Nat.add as Nat

instance
  AddNat : Add Nat
  AddNat = make-add Nat.add
