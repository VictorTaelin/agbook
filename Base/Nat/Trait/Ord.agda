module Base.Nat.Trait.Ord where

open import Base.Nat.Nat
import Base.Nat.compare as Nat
import Base.Nat.gt as Nat
import Base.Nat.gte as Nat
import Base.Nat.lt as Nat
import Base.Nat.lte as Nat
open import Base.Trait.Ord

instance
  OrdNat : Ord Nat
  OrdNat = MkOrd Nat.compare Nat.lt Nat.gt Nat.lte Nat.gte
