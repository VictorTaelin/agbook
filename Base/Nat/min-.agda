module Base.Nat.min- where

open import Base.Nat.Nat
open import Base.Nat.min
open import Base.Equal.Equal

-- Test: min 0 0 = 0.
T0 : min 0 0 ≡ 0
T0 = refl

-- Test: min 0 5 = 0.
T1 : min 0 5 ≡ 0
T1 = refl

-- Test: min 5 0 = 0.
T2 : min 5 0 ≡ 0
T2 = refl

-- Test: min 3 2 = 2.
T3 : min 3 2 ≡ 2
T3 = refl

-- Test: min 7 8 = 7.
T4 : min 7 8 ≡ 7
T4 = refl

-- Test: min 8 7 = 7.
T5 : min 8 7 ≡ 7
T5 = refl

-- Test: Commutativity: min a b = min b a.
T6 : min 3 4 ≡ min 4 3
T6 = refl

-- Test: Idempotence: min a a = a.
T7 : min 5 5 ≡ 5
T7 = refl

-- Test: min with equal values.
T8 : min 6 6 ≡ 6
T8 = refl

