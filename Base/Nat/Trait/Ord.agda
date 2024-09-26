module Base.Nat.Trait.Ord where

open import Base.Nat.Nat
import Base.Trait.Ord as Ord
import Base.Nat.lt as Nat
import Base.Nat.lte as Nat
import Base.Nat.gt as Nat
import Base.Nat.gte as Nat
import Base.Nat.compare as Nat

instance
  OrdNat : Ord.Ord Nat
  OrdNat = record
    { compare = Nat.compare
    ; lt = Nat.lt
    ; lte = Nat.lte
    ; gt = Nat.gt
    ; gte = Nat.gte
    }
