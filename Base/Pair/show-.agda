module Base.Pair.show- where

open import Base.Pair.Pair
open import Base.Pair.show
open import Base.Nat.Nat
open import Base.Nat.show
open import Base.Bool.Bool
open import Base.Bool.show
open import Base.String.String
open import Base.Equal.Equal

test-show-nat-bool : show (1 , True) ≡ "(1, true)"
test-show-nat-bool = refl

test-show-nat-bool-2 : show (42 , False) ≡ "(42, false)"
test-show-nat-bool-2 = refl

test-show-nat-nat : show (1 , 1) ≡ "(1, 1)"
test-show-nat-nat = refl
