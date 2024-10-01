module Base.Nat.min- where

open import Base.Nat.Nat
open import Base.Nat.min
open import Base.Equal.Equal

-- Test: min 0 0 = 0
test-min-zero-zero : min 0 0 ≡ 0
test-min-zero-zero = refl

-- Test: min 0 5 = 0
test-min-zero-five : min 0 5 ≡ 0
test-min-zero-five = refl

-- Test: min 5 0 = 0
test-min-five-zero : min 5 0 ≡ 0
test-min-five-zero = refl

-- Test: min 3 2 = 2
test-min-three-two : min 3 2 ≡ 2
test-min-three-two = refl

-- Test: min 7 8 = 7
test-min-seven-eight : min 7 8 ≡ 7
test-min-seven-eight = refl

-- Test: min 8 7 = 7
test-min-eight-seven : min 8 7 ≡ 7
test-min-eight-seven = refl

-- Test: Commutativity: min a b = min b a
test-min-commutative : min 3 4 ≡ min 4 3
test-min-commutative = refl

-- Test: Idempotence: min a a = a
test-min-idempotent : min 5 5 ≡ 5
test-min-idempotent = refl

-- Test: min with equal values
test-min-equal-values : min 6 6 ≡ 6
test-min-equal-values = refl
