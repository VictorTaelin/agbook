module Base.Nat.Test.sub where

open import Base.Nat.Nat
open import Base.Nat.sub
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 - 0 = 0
test-sub-zero-zero : (0 - 0) ≡ 0
test-sub-zero-zero = refl

-- Test: 5 - 0 = 5
test-sub-five-zero : (5 - 0) ≡ 5
test-sub-five-zero = refl

-- Test: 0 - 5 = 0 (subtraction doesn't go below zero)
test-sub-zero-five : (0 - 5) ≡ 0
test-sub-zero-five = refl

-- Test: 5 - 2 = 3
test-sub-five-two : (5 - 2) ≡ 3
test-sub-five-two = refl

-- Test: 10 - 7 = 3
test-sub-ten-seven : (10 - 7) ≡ 3
test-sub-ten-seven = refl

-- Test: 8 - 8 = 0
test-sub-eight-eight : (8 - 8) ≡ 0
test-sub-eight-eight = refl

-- Test: 3 - 5 = 0 (subtraction doesn't go below zero)
test-sub-three-five : (3 - 5) ≡ 0
test-sub-three-five = refl

-- Test: (a - b) - c = a - (b + c)
test-sub-associative : ((10 - 3) - 2) ≡ (10 - (3 + 2))
test-sub-associative = refl
