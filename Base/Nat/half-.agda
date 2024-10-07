module Base.Nat.half- where

open import Base.Nat.Nat
open import Base.Nat.half
open import Base.Equal.Equal

-- Test cases for the half function

-- Test: half of 0 is 0
T0 : half 0 ≡ 0
T0 = refl

-- Test: half of 1 is 0
T1 : half 1 ≡ 0
T1 = refl

-- Test: half of 2 is 1
T2 : half 2 ≡ 1
T2 = refl

-- Test: half of 3 is 1
T3 : half 3 ≡ 1
T3 = refl

-- Test: half of 4 is 2
T4 : half 4 ≡ 2
T4 = refl

-- Test: half of 5 is 2
T5 : half 5 ≡ 2
T5 = refl
