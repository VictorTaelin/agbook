module Base.Nat.double- where

open import Base.Nat.Nat
open import Base.Nat.double
open import Base.Nat.add
open import Base.Equal.Equal

-- Test: double 0 = 0
T0 : double 0 ≡ 0
T0 = refl

-- Test: double 1 = 2
T2 : double 1 ≡ 2
T2 = refl

-- Test: double 2 = 4
T3 : double 2 ≡ 4
T3 = refl

-- Test: double 5 = 10
T4 : double 5 ≡ 10
T4 = refl

-- Test: double (double 2) = 8
T5 : double (double 2) ≡ 8
T5 = refl

-- Test: double (3 + 2) = double 3 + double 2
T6 : double (3 + 2) ≡ (double 3 + double 2)
T6 = refl

