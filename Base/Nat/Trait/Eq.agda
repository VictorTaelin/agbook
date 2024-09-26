module Base.Nat.Trait.Eq where

open import Base.Nat.Nat
import Base.Trait.Eq as Eq
import Base.Nat.eq as Nat
import Base.Nat.neq as Nat

instance
  EqNat : Eq.Eq Nat
  EqNat = Eq.make-eq Nat.eq Nat.neq
