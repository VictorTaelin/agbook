module Base.Nat.eq- where

open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.neq
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: equality of the same number
T0 : (42 == 42) ≡ True
T0 = refl

-- Test: equality of different numbers
T1 : (42 == 43) ≡ False
T1 = refl

-- Test: equality of zero
T2 : (0 == 0) ≡ True
T2 = refl

-- Test: inequality of the same number
T3 : (4 != 4) ≡ False
T3 = refl