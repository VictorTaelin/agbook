module Base.Nat.lt- where

open import Base.Nat.Nat
open import Base.Nat.lt
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests the less than operation for natural numbers.

-- Test: 0 < 0 = False
T0 : (0 < 0) ≡ False
T0 = refl

-- Test: 0 < 1 = True
T1 : (0 < 1) ≡ True
T1 = refl

-- Test: 1 < 0 = False
T2 : (1 < 0) ≡ False
T2 = refl

-- Test: 2 < 5 = True
T3 : (2 < 5) ≡ True
T3 = refl

-- Test: 5 < 2 = False
T4 : (5 < 2) ≡ False
T4 = refl

-- Test: 7 < 7 = False
T5 : (7 < 7) ≡ False
T5 = refl

-- Test: Transitivity: if a < b and b < c, then a < c
T6 : (3 < 5) ≡ True → (5 < 8) ≡ True → (3 < 8) ≡ True
T6 refl refl = refl

-- Test: Irreflexivity: a < a = False
T7 : (4 < 4) ≡ False
T7 = refl