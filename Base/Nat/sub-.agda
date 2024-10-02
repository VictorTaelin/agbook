module Base.Nat.sub- where

open import Base.Nat.Nat
open import Base.Nat.sub
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests the subtraction operation for natural numbers.

-- Test: 0 - 0 = 0.
T0 : (0 - 0) ≡ 0
T0 = refl

-- Test: 5 - 0 = 5.
T1 : (5 - 0) ≡ 5
T1 = refl

-- Test: 0 - 5 = 0 (subtraction doesn't go below zero).
T2 : (0 - 5) ≡ 0
T2 = refl

-- Test: 5 - 2 = 3.
T3 : (5 - 2) ≡ 3
T3 = refl

-- Test: 10 - 7 = 3.
T4 : (10 - 7) ≡ 3
T4 = refl

-- Test: 8 - 8 = 0.
T5 : (8 - 8) ≡ 0
T5 = refl

-- Test: 3 - 5 = 0 (subtraction doesn't go below zero).
T6 : (3 - 5) ≡ 0
T6 = refl

-- Test: (a - b) - c = a - (b + c).
T7 : ((10 - 3) - 2) ≡ (10 - (3 + 2))
T7 = refl
