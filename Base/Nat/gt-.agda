module Base.Nat.gt- where

open import Base.Nat.Nat
open import Base.Nat.gt
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test cases for gt function
test-gt-1 : (3 > 2) ≡ True
test-gt-1 = refl

test-gt-2 : (2 > 3) ≡ False
test-gt-2 = refl

test-gt-3 : (5 > 5) ≡ False
test-gt-3 = refl

test-gt-4 : (0 > 0) ≡ False
test-gt-4 = refl

test-gt-5 : (1 > 0) ≡ True
test-gt-5 = refl

test-gt-6 : (0 > 1) ≡ False
test-gt-6 = refl

test-gt-7 : (10 > 5) ≡ True
test-gt-7 = refl

test-gt-8 : (100 > 99) ≡ True
test-gt-8 = refl

test-gt-9 : (42 > 42) ≡ False
test-gt-9 = refl
