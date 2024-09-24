module Base.U64.lt where

open import Base.U64.Type
open import Base.Bool.Type
import Base.Nat.lt as Nat
open import Base.U64.to-nat

lt : U64 -> U64 -> Bool
lt x y = Nat.lt (to-nat x) (to-nat y)

infix 4 _<_
_<_ : U64 -> U64 -> Bool
_<_ = lt
