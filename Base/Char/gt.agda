module Base.Char.gt where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.gt as Nat

gt : Char -> Char -> Bool
gt x y = Nat.gt (to-nat x) (to-nat y)

infix 4 _>_
_>_ : Char -> Char -> Bool
_>_ = gt
