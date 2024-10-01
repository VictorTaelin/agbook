module Base.Nat.half- where

open import Base.Nat.Nat
open import Base.Nat.half
open import Base.Equal.Equal

-- Test cases for the half function

-- Test: half of 0 is 0
test-half-zero : half 0 ≡ 0
test-half-zero = refl

-- Test: half of 1 is 0
test-half-one : half 1 ≡ 0
test-half-one = refl

-- Test: half of 2 is 1
test-half-two : half 2 ≡ 1
test-half-two = refl

-- Test: half of 3 is 1
test-half-three : half 3 ≡ 1
test-half-three = refl

-- Test: half of 4 is 2
test-half-four : half 4 ≡ 2
test-half-four = refl

-- Test: half of 5 is 2
test-half-five : half 5 ≡ 2
test-half-five = refl
