module Base.Nat.gt where

open import Base.Nat.Nat
open import Base.Bool.Bool

gt : Nat -> Nat -> Bool
gt Zero     _        = False
gt (Succ _) Zero     = True
gt (Succ x) (Succ y) = gt x y

infix 4 _>_
_>_ : Nat -> Nat -> Bool
_>_ = gt
