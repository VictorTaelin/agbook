module Base.Nat.lt where

open import Base.Nat.Type
open import Base.Bool.Type

lt : Nat -> Nat -> Bool
lt Zero     Zero     = False
lt Zero     (Succ _) = True
lt (Succ x) (Succ y) = lt x y
lt (Succ _) Zero     = False

infix 4 _<_
_<_ : Nat -> Nat -> Bool
_<_ = lt
