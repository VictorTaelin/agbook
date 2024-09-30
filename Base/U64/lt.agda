module Base.U64.lt where

open import Base.U64.U64
open import Base.Bool.Bool
import Base.Nat.lt as Nat
open import Base.U64.to-nat

lt : U64 → U64 → Bool
lt x y = Nat.lt (to-nat x) (to-nat y)

infix 4 _<_
_<_ : U64 → U64 → Bool
_<_ = lt
