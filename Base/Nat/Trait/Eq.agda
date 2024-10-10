module Base.Nat.Trait.Eq where

open import Base.Nat.Nat
import Base.Nat.eq as Nat
import Base.Nat.neq as Nat
open import Base.Trait.Eq

instance
  EqNat : Eq Nat
  EqNat = MkEq Nat.eq Nat.neq

