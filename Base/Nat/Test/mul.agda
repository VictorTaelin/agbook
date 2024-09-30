module Base.Nat.Test.mul where

open import Base.Nat.Nat
open import Base.Nat.mul
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 * 0 = 0
test-mul-zero-zero : (0 * 0) ≡ 0
test-mul-zero-zero = refl

-- Test: 0 * 5 = 0
test-mul-zero-five : (0 * 5) ≡ 0
test-mul-zero-five = refl

-- Test: 5 * 0 = 0
test-mul-five-zero : (5 * 0) ≡ 0
test-mul-five-zero = refl

-- Test: 1 * 5 = 5
test-mul-one-five : (1 * 5) ≡ 5
test-mul-one-five = refl

-- Test: 5 * 1 = 5
test-mul-five-one : (5 * 1) ≡ 5
test-mul-five-one = refl

-- Test: 3 * 2 = 6
test-mul-three-two : (3 * 2) ≡ 6
test-mul-three-two = refl

-- Test: 7 * 8 = 56
test-mul-seven-eight : (7 * 8) ≡ 56
test-mul-seven-eight = refl

-- Test: Commutativity: a * b = b * a
test-mul-commutative : (3 * 4) ≡ (4 * 3)
test-mul-commutative = refl

-- Test: Distributivity: a * (b + c) = (a * b) + (a * c)
test-mul-distributive : (2 * (3 + 4)) ≡ ((2 * 3) + (2 * 4))
test-mul-distributive = refl

-- Test: Associativity: (a * b) * c = a * (b * c)
test-mul-associative : ((2 * 3) * 4) ≡ (2 * (3 * 4))
test-mul-associative = refl
