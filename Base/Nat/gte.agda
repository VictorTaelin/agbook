module Base.Nat.gte where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Nat.lte

gte : Nat -> Nat -> Bool
gte x y = y <= x

infix 4 _>=_
_>=_ : Nat -> Nat -> Bool
_>=_ = gte
