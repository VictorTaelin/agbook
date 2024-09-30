module Base.Char.lt where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Char.to-nat
import Base.Nat.lt as Nat

lt : Char → Char → Bool
lt x y = Nat.lt (to-nat x) (to-nat y)

infix 4 _<_
_<_ : Char → Char → Bool
_<_ = lt
