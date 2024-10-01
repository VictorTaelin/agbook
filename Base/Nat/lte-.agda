module Base.Nat.lte- where

open import Base.Nat.Nat
open import Base.Nat.lte
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test cases for lte function
test-lte-1 : (0 <= 0) ≡ True
test-lte-1 = refl

test-lte-2 : (0 <= 1) ≡ True
test-lte-2 = refl

test-lte-3 : (1 <= 0) ≡ False
test-lte-3 = refl

test-lte-4 : (1 <= 1) ≡ True
test-lte-4 = refl

test-lte-5 : (1 <= 2) ≡ True
test-lte-5 = refl

test-lte-6 : (2 <= 1) ≡ False
test-lte-6 = refl

test-lte-7 : (5 <= 10) ≡ True
test-lte-7 = refl

test-lte-8 : (10 <= 5) ≡ False
test-lte-8 = refl
