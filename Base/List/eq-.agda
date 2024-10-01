module Base.List.eq- where

open import Base.List.List
open import Base.List.eq
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Equal.Equal

test-eq-different-lists : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 4 :: [])) ≡ False
test-eq-different-lists = refl

test-eq-empty-lists : ([] == ([] {A = Nat})) ≡ True
test-eq-empty-lists = refl

test-eq-identical-lists : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) ≡ True
test-eq-identical-lists = refl

test-eq-different-length : ((1 :: 2 :: []) == (1 :: 2 :: 3 :: [])) ≡ False
test-eq-different-length = refl

test-neq-bool-lists : ((True :: False :: []) != (True :: True :: [])) ≡ True
test-neq-bool-lists = refl
