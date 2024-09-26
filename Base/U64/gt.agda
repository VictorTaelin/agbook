module Base.U64.gt where

open import Base.U64.U64
open import Base.Bool.Bool
import Base.Nat.gt as Nat
open import Base.U64.to-nat

gt : U64 -> U64 -> Bool
gt x y = Nat.gt (to-nat x) (to-nat y)

infix 4 _>_
_>_ : U64 -> U64 -> Bool
_>_ = gt
