module Base.Nat.is-zero- where

open import Base.Nat.Nat
open import Base.Nat.is-zero
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests for the N/is-zero function.

-- Test: is-zero of Zero should be True
T0 : is-zero 0 ≡ True
T0 = refl

-- Test: is-zero of 1 should be False
T1 : is-zero 1 ≡ False
T1 = refl

-- Test: is-zero of 2 should be False
T2 : is-zero 2 ≡ False
T2 = refl

