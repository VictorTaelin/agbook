module Base.List.Test.show where

open import Base.List.Type
open import Base.List.show
open import Base.Nat.Type
open import Base.Nat.show
open import Base.String.Type
open import Base.Equal.Type

test-show-nat-list : show (1 :: 2 :: 3 :: []) ≡ "[1, 2, 3]"
test-show-nat-list = refl

test-show-empty-nat-list : show ([] {A = Nat}) ≡ "[]"
test-show-empty-nat-list = refl

test-show-empty-list : show [] ≡ "[]"
test-show-empty-list = refl