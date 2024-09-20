module Base.Nat.Trait.Show where

open import Base.Nat.Type
import Base.Trait.Show as Show
import Base.Nat.show as Nat

instance
  ShowNat : Show.Show Nat
  ShowNat = record { to-string = Nat.show }
