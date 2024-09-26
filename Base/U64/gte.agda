module Base.U64.gte where

open import Base.U64.U64
open import Base.Bool.Bool
import Base.Nat.gte as Nat
open import Base.U64.to-nat

gte : U64 -> U64 -> Bool
gte x y = Nat.gte (to-nat x) (to-nat y)

infix 4 _>=_
_>=_ : U64 -> U64 -> Bool
_>=_ = gte
