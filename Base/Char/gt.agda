module Base.Char.gt where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Char.to-nat
import Base.Nat.gt as Nat

gt : Char → Char → Bool
gt x y = Nat.gt (to-nat x) (to-nat y)
