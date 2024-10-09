module Base.Nat.gte- where

open import Base.Nat.Nat
open import Base.Nat.gte
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests for the greater than or equal to function on natural numbers.

-- Test : 5 >= 3 should be True.
T0 : (5 >= 3) ≡ True
T0 = refl

-- Test : 3 >= 5 should be False.
T1 : (3 >= 5) ≡ False
T1 = refl

-- Test : 4 >= 4 should be True.
T2 : (4 >= 4) ≡ True
T2 = refl

-- Test : 0 >= 0 should be True.
T3 : (0 >= 0) ≡ True
T3 = refl

-- Test : 1 >= 0 should be True.
T4 : (1 >= 0) ≡ True
T4 = refl

-- Test : 0 >= 1 should be False.
T5 : (0 >= 1) ≡ False
T5 = refl

-- Test : 2 >= 1 should be True.
T6 : (Succ (Succ Zero) >= Succ Zero) ≡ True
T6 = refl

-- Test : 1 >= 2 should be False.
T7 : (Succ Zero >= Succ (Succ Zero)) ≡ False
T7 = refl

