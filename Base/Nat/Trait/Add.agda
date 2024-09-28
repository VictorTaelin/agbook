module Base.Nat.Trait.Add where

open import Base.Nat.Nat
import Base.Nat.add as Nat
open import Base.Trait.Add

instance
  AddNat : Add Nat
  AddNat = MkAdd Nat.add
