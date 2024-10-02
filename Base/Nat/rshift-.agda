module Base.Nat.rshift- where

open import Base.Nat.Nat
open import Base.Nat.rshift
open import Base.Equal.Equal

-- Tests the right shift function for natural numbers.

-- Test: 0 >> 1 = 0.
T0 : (0 >> 1) ≡ 0
T0 = refl

-- Test: 1 >> 1 = 0.
T1 : (1 >> 1) ≡ 0
T1 = refl

-- Test: 2 >> 1 = 1.
T2 : (2 >> 1) ≡ 1
T2 = refl

-- Test: 4 >> 1 = 2.
T3 : (4 >> 1) ≡ 2
T3 = refl

-- Test: 8 >> 2 = 2.
T4 : (8 >> 2) ≡ 2
T4 = refl

-- Test: 16 >> 3 = 2.
T5 : (16 >> 3) ≡ 2
T5 = refl

-- Test: 100 >> 2 = 25.
T6 : (100 >> 2) ≡ 25
T6 = refl

-- Test: 1000 >> 3 = 125.
T7 : (1000 >> 3) ≡ 125
T7 = refl

