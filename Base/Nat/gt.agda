module Base.Nat.gt where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Nat.lt

gt : Nat -> Nat -> Bool
gt x y = y < x

infix 4 _>_
_>_ : Nat -> Nat -> Bool
_>_ = gt
