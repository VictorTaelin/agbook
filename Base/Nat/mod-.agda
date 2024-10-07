module Base.Nat.mod- where

open import Base.Nat.Nat
open import Base.Nat.mod
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 % 5 = 0.
T0 : (0 % 5) ≡ 0
T0 = refl

-- Test: 5 % 1 = 0.
T1 : (5 % 1) ≡ 0
T1 = refl

-- Test: 7 % 3 = 1.
T2 : (7 % 3) ≡ 1
T2 = refl

-- Test: 10 % 4 = 2.
T3 : (10 % 4) ≡ 2
T3 = refl

-- Test: 15 % 5 = 0.
T4 : (15 % 5) ≡ 0
T4 = refl

-- Test: 17 % 6 = 5.
T5 : (17 % 6) ≡ 5
T5 = refl

-- Test: (a % b) % b = a % b.
T6 : ((13 % 5) % 5) ≡ (13 % 5)
T6 = refl

-- Test: (a + b) % b = a % b.
T7 : ((7 + 3) % 3) ≡ (7 % 3)
T7 = refl
