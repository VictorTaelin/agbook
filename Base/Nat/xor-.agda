module Base.Nat.xor- where

open import Base.Nat.Nat
open import Base.Nat.xor
open import Base.Equal.Equal

-- Tests the xor function for natural numbers.

-- Test: 0 ^ 0 = 0.
T0 : (0 ^ 0) ≡ 0
T0 = refl

-- Test: 0 ^ 1 = 1.
T1 : (0 ^ 1) ≡ 1
T1 = refl

-- Test: 1 ^ 0 = 1.
T2 : (1 ^ 0) ≡ 1
T2 = refl

-- Test: 1 ^ 1 = 0.
T3 : (1 ^ 1) ≡ 0
T3 = refl

-- Test: 3 ^ 5 = 6.
T4 : (3 ^ 5) ≡ 6
T4 = refl

-- Test: 10 ^ 6 = 12.
T5 : (10 ^ 6) ≡ 12
T5 = refl

-- Test: 15 ^ 8 = 7.
T6 : (15 ^ 8) ≡ 7
T6 = refl

-- Test: 255 ^ 170 = 85.
T7 : (255 ^ 170) ≡ 85
T7 = refl
