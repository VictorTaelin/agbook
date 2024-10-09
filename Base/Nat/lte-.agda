module Base.Nat.lte- where

open import Base.Nat.Nat
open import Base.Nat.lte
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test cases for lte function

-- Test: 0 <= 0 is True.
T0 : (0 <= 0) ≡ True
T0 = refl

-- Test: 0 <= 1 is True
T1 : (0 <= 1) ≡ True
T1 = refl

-- Test: 1 <= 0 is False.
T2 : (1 <= 0) ≡ False
T2 = refl

-- Test: 1 <= 1 is True.
T3 : (1 <= 1) ≡ True
T3 = refl

-- Test: 1 <= 2 is True.
T4 : (1 <= 2) ≡ True
T4 = refl

-- Test: 2 <= 1 is False.
T5 : (2 <= 1) ≡ False
T5 = refl

-- Test: 5 <= 10 is True.
T6 : (5 <= 10) ≡ True
T6 = refl

-- Test: 10 <= 5 is False.
T7 : (10 <= 5) ≡ False
T7 = refl

