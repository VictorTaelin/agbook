module Base.Nat.double- where

open import Base.Nat.Nat
open import Base.Nat.double
open import Base.Nat.add
open import Base.Equal.Equal

-- Test: double 0 = 0
test-double-zero : double 0 ≡ 0
test-double-zero = refl

-- Test: double 1 = 2
test-double-one : double 1 ≡ 2
test-double-one = refl

-- Test: double 2 = 4
test-double-two : double 2 ≡ 4
test-double-two = refl

-- Test: double 5 = 10
test-double-five : double 5 ≡ 10
test-double-five = refl

-- Test: double (double 2) = 8
test-double-double-two : double (double 2) ≡ 8
test-double-double-two = refl

-- Test: double (3 + 2) = double 3 + double 2
test-double-distributive : double (3 + 2) ≡ (double 3 + double 2)
test-double-distributive = refl
