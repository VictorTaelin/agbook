module Base.Nat.gt- where

open import Base.Nat.Nat
open import Base.Nat.gt
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests the greater than function for natural numbers.

-- Test: 3 > 2 = True
T0 : (3 > 2) ≡ True
T0 = refl

-- Test: 2 > 3 = False
T1 : (2 > 3) ≡ False
T1 = refl

-- Test: 5 > 5 = False
T2 : (5 > 5) ≡ False
T2 = refl

-- Test: 0 > 0 = False
T3 : (0 > 0) ≡ False
T3 = refl

-- Test: 1 > 0 = True
T4 : (1 > 0) ≡ True
T4 = refl

-- Test: 0 > 1 = False
T5 : (0 > 1) ≡ False
T5 = refl

-- Test: 10 > 5 = True
T6 : (10 > 5) ≡ True
T6 = refl

-- Test: 100 > 99 = True
T7 : (100 > 99) ≡ True
T7 = refl

-- Test: 42 > 42 = False
T8 : (42 > 42) ≡ False
T8 = refl