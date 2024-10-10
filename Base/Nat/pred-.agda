module Base.Nat.pred- where

open import Base.Nat.Nat
open import Base.Nat.pred
open import Base.Equal.Equal

-- Tests the predecessor function for natural numbers.

-- Test: pred 0 = 0.
T0 : pred 0 ≡ 0
T0 = refl

-- Test: pred 1 = 0.
T1 : pred 1 ≡ 0
T1 = refl

-- Test: pred 2 = 1.
T2 : pred 2 ≡ 1
T2 = refl

-- Test: pred 5 = 4.
T3 : pred 5 ≡ 4
T3 = refl

-- Test: pred (pred 3) = 1.
T4 : pred (pred 3) ≡ 1
T4 = refl

-- Test: pred (pred 1) = 0.
T5 : pred (pred 1) ≡ 0
T5 = refl

-- Test: pred (pred 0) = 0.
T6 : pred (pred 0) ≡ 0
T6 = refl

