module Base.Nat.max- where

open import Base.Nat.Nat
open import Base.Nat.max
open import Base.Equal.Equal

-- Test: max 0 0 = 0
test-max-zero-zero : max 0 0 ≡ 0
test-max-zero-zero = refl

-- Test: max 0 5 = 5
test-max-zero-five : max 0 5 ≡ 5
test-max-zero-five = refl

-- Test: max 5 0 = 5
test-max-five-zero : max 5 0 ≡ 5
test-max-five-zero = refl

-- Test: max 3 2 = 3
test-max-three-two : max 3 2 ≡ 3
test-max-three-two = refl

-- Test: max 2 3 = 3
test-max-two-three : max 2 3 ≡ 3
test-max-two-three = refl

-- Test: max 7 7 = 7
test-max-seven-seven : max 7 7 ≡ 7
test-max-seven-seven = refl

-- Test: Commutativity: max a b = max b a
test-max-commutative : max 4 6 ≡ max 6 4
test-max-commutative = refl

-- Test: Idempotence: max a a = a
test-max-idempotent : max 8 8 ≡ 8
test-max-idempotent = refl

-- Test: Associativity: max a (max b c) = max (max a b) c
test-max-associative : max 2 (max 3 4) ≡ max (max 2 3) 4
test-max-associative = refl
