module Base.Nat.to-bits- where

open import Base.Nat.Nat
open import Base.Nat.to-bits
open import Base.Bits.Bits
open import Base.Equal.Equal

-- Tests the to-bits function for natural numbers.

-- Test: to-bits 0 = O E.
T0 : to-bits 0 ≡ (O E)
T0 = refl

-- Test: to-bits 1 = I E.
T1 : to-bits 1 ≡ (I E)
T1 = refl

-- Test: to-bits 2 = I (O E).
T2 : to-bits 2 ≡ O (I E)
T2 = refl

-- Test: to-bits 3 = I (I E).
T3 : to-bits 3 ≡ I (I E)
T3 = refl

-- Test: to-bits 4 = I (O (O E)).
T4 : to-bits 4 ≡ O (O (I E))
T4 = refl

-- Test: to-bits 5 = I (O (I E)).
T5 : to-bits 5 ≡ I (O (I E))
T5 = refl

-- Test: to-bits 8 = I (O (O (O E))).
T6 : to-bits 8 ≡ O (O (O (I E)))
T6 = refl

-- Test: to-bits 15 = I (I (I (I E))).
T7 : to-bits 15 ≡ I (I (I (I E)))
T7 = refl

