module Base.U64.eq where

open import Base.U64.U64
open import Base.Nat.Nat
open import Base.Bool.Bool
import Base.Nat.eq as Nat
open import Base.U64.to-nat

eq : U64 -> U64 -> Bool
eq x y = Nat.eq (to-nat x) (to-nat y)

infix 4 _==_
_==_ : U64 -> U64 -> Bool
_==_ = eq
