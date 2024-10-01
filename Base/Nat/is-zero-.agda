module Base.Nat.is-zero- where

open import Base.Nat.Nat
open import Base.Nat.is-zero
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: is-zero of Zero should be True
test-is-zero-zero : is-zero 0 ≡ True
test-is-zero-zero = refl

-- Test: is-zero of 1 should be False
test-is-zero-one : is-zero 1 ≡ False
test-is-zero-one = refl

-- Test: is-zero of 2 should be False
test-is-zero-two : is-zero 2 ≡ False
test-is-zero-two = refl

