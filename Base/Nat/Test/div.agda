module Base.Nat.Test.div where

open import Base.Nat.Nat
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.mod
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 / 1 = 0
test-div-zero-one : (0 / 1) ≡ 0
test-div-zero-one = refl

-- Test: 5 / 1 = 5
test-div-five-one : (5 / 1) ≡ 5
test-div-five-one = refl

-- Test: 5 / 2 = 2
test-div-five-two : (5 / 2) ≡ 2
test-div-five-two = refl

-- Test: 10 / 3 = 3
test-div-ten-three : (10 / 3) ≡ 3
test-div-ten-three = refl

-- Test: 15 / 5 = 3
test-div-fifteen-five : (15 / 5) ≡ 3
test-div-fifteen-five = refl

-- Test: 100 / 10 = 10
test-div-hundred-ten : (100 / 10) ≡ 10
test-div-hundred-ten = refl

-- Test: Division by zero returns zero
test-div-by-zero : (5 / 0) ≡ 0
test-div-by-zero = refl

-- Test: (a / b) * b + (a % b) = a (for non-zero b)
test-div-mul-mod-identity : ((15 / 4) * 4 + (15 % 4)) ≡ 15
test-div-mul-mod-identity = refl
