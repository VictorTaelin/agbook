module Base.Nat.Test.mod where

open import Base.Nat.Nat
open import Base.Nat.mod
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 % 5 = 0
test-mod-zero-five : (0 % 5) ≡ 0
test-mod-zero-five = refl

-- Test: 5 % 1 = 0
test-mod-five-one : (5 % 1) ≡ 0
test-mod-five-one = refl

-- Test: 7 % 3 = 1
test-mod-seven-three : (7 % 3) ≡ 1
test-mod-seven-three = refl

-- Test: 10 % 4 = 2
test-mod-ten-four : (10 % 4) ≡ 2
test-mod-ten-four = refl

-- Test: 15 % 5 = 0
test-mod-fifteen-five : (15 % 5) ≡ 0
test-mod-fifteen-five = refl

-- Test: 17 % 6 = 5
test-mod-seventeen-six : (17 % 6) ≡ 5
test-mod-seventeen-six = refl

-- Test: (a % b) % b = a % b
test-mod-idempotent : ((13 % 5) % 5) ≡ (13 % 5)
test-mod-idempotent = refl

-- Test: (a + b) % b = a % b
test-mod-sum : ((7 + 3) % 3) ≡ (7 % 3)
test-mod-sum = refl
