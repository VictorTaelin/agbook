module Base.Char.gte where

open import Base.Char.Type
open import Base.Bool.Type
open import Base.Char.to-nat
import Base.Nat.gte as Nat

gte : Char → Char → Bool
gte x y = Nat.gte (to-nat x) (to-nat y)

infix 4 _>=_
_>=_ : Char → Char → Bool
_>=_ = gte
