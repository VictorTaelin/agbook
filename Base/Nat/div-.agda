module Base.Nat.div- where

open import Base.Nat.Nat
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.mod
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Division of zero by one.
-- = 0
T0 : (0 / 1) ≡ 0
T0 = refl

-- Test: Division of five by one.
-- = 5
T1 : (5 / 1) ≡ 5
T1 = refl

-- Test: Division of five by two.
-- = 2
T2 : (5 / 2) ≡ 2
T2 = refl

-- Test: Division of ten by three.
-- = 3
T3 : (10 / 3) ≡ 3
T3 = refl

-- Test: Division of fifteen by five.
-- = 3
T4 : (15 / 5) ≡ 3
T4 = refl

-- Test: Division of one hundred by ten.
-- = 10
T5 : (100 / 10) ≡ 10
T5 = refl

-- Test: Division by zero returns zero.
-- = 0
T6 : (5 / 0) ≡ 0
T6 = refl

-- Test: Division-multiplication-modulo identity.
-- This test verifies that (a / b) * b + (a % b) = a for non-zero b.
-- = 15
T7 : ((15 / 4) * 4 + (15 % 4)) ≡ 15
T7 = refl