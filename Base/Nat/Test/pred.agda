module Base.Nat.Test.pred where

open import Base.Nat.Nat
open import Base.Nat.pred
open import Base.Equal.Equal

-- Test: pred 0 = 0
test-pred-zero : pred 0 ≡ 0
test-pred-zero = refl

-- Test: pred 1 = 0
test-pred-one : pred 1 ≡ 0
test-pred-one = refl

-- Test: pred 2 = 1
test-pred-two : pred 2 ≡ 1
test-pred-two = refl

-- Test: pred 5 = 4
test-pred-five : pred 5 ≡ 4
test-pred-five = refl

-- Test: pred (pred 3) = 1
test-pred-pred-three : pred (pred 3) ≡ 1
test-pred-pred-three = refl

-- Test: pred (pred 1) = 0
test-pred-pred-one : pred (pred 1) ≡ 0
test-pred-pred-one = refl

-- Test: pred (pred 0) = 0
test-pred-pred-zero : pred (pred 0) ≡ 0
test-pred-pred-zero = refl
