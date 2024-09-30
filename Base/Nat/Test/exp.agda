module Base.Nat.Test.exp where

open import Base.Nat.Nat
open import Base.Nat.exp
open import Base.Nat.mul
open import Base.Equal.Equal

-- Test: 2⁰ = 1
test-exp-two-zero : (2 ** 0) ≡ 1
test-exp-two-zero = refl

-- Test: 2¹ = 2
test-exp-two-one : (2 ** 1) ≡ 2
test-exp-two-one = refl

-- Test: 2² = 4
test-exp-two-two : (2 ** 2) ≡ 4
test-exp-two-two = refl

-- Test: 3² = 9
test-exp-three-two : (3 ** 2) ≡ 9
test-exp-three-two = refl

-- Test: 5¹ = 5
test-exp-five-one : (5 ** 1) ≡ 5
test-exp-five-one = refl

-- Test: 10⁰ = 1
test-exp-ten-zero : (10 ** 0) ≡ 1
test-exp-ten-zero = refl

-- Test: 3³ = 27
test-exp-three-three : (3 ** 3) ≡ 27
test-exp-three-three = refl

-- Test: 1⁵ = 1
test-exp-one-five : (1 ** 5) ≡ 1
test-exp-one-five = refl

-- Test: 0² = 0
test-exp-zero-two : (0 ** 2) ≡ 0
test-exp-zero-two = refl

-- Test: Exponentiation property: (a^b)^c = a^(b*c)
test-exp-property : ((2 ** 3) ** 2) ≡ (2 ** (3 * 2))
test-exp-property = refl
