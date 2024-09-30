module Base.Nat.Test.range where

open import Base.Nat.Nat
open import Base.Nat.range
open import Base.List.List
open import Base.List.eq
open import Base.Equal.Equal
open import Base.Bool.Bool

-- Test cases for the range function

-- Test 1: Empty range
test-range-empty : range 5 5 ≡ []
test-range-empty = refl

-- Test 2: Single element range
test-range-single : range 3 4 ≡ (3 :: [])
test-range-single = refl

-- Test 3: Multiple element range
test-range-multiple : range 1 5 ≡ (1 :: 2 :: 3 :: 4 :: [])
test-range-multiple = refl

-- Test 4: Range starting from zero
test-range-from-zero : range 0 3 ≡ (0 :: 1 :: 2 :: [])
test-range-from-zero = refl

-- Test 5: Reversed range (should be empty)
test-range-reversed : range 5 2 ≡ []
test-range-reversed = refl

