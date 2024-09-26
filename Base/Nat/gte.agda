module Base.Nat.gte where

open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Nat.gt
open import Base.Nat.eq

gte : Nat -> Nat -> Bool
gte x y = (eq x y) || (gt x y)


infix 4 _>=_
_>=_ : Nat -> Nat -> Bool
_>=_ = gte
