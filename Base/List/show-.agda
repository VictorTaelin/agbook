module Base.List.show- where

open import Base.List.List
open import Base.List.show
open import Base.Nat.Nat
open import Base.Nat.Trait.Show
open import Base.String.String
open import Base.Equal.Equal

test-show-nat-list : show (1 :: 2 :: 3 :: []) ≡ "[1, 2, 3]"
test-show-nat-list = refl

test-show-empty-nat-list : show ([] {A = Nat}) ≡ "[]"
test-show-empty-nat-list = refl

test-show-empty-list : show [] ≡ "[]"
test-show-empty-list = refl
