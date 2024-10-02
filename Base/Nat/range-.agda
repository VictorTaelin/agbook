module Base.Nat.range- where

open import Base.Nat.Nat
open import Base.Nat.range
open import Base.List.List
open import Base.List.eq
open import Base.Equal.Equal
open import Base.Bool.Bool

-- Test cases for the range function

-- Test 1: Empty range
T0 : range 5 5 ≡ []
T0 = refl

-- Test 2: Single element range
T1 : range 3 4 ≡ (3 :: [])
T1 = refl

-- Test 3: Multiple element range
T2 : range 1 5 ≡ (1 :: 2 :: 3 :: 4 :: [])
T2 = refl

-- Test 4: Range starting from zero
T3 : range 0 3 ≡ (0 :: 1 :: 2 :: [])
T3 = refl

-- Test 5: Reversed range (should be empty)
T4 : range 5 2 ≡ []
T4 = refl

