module Base.Nat.Trait.Show where

open import Base.Nat.Nat
import Base.Nat.show as Nat
open import Base.Trait.Show

instance
  ShowNat : Show Nat
  ShowNat = MkShow Nat.show

