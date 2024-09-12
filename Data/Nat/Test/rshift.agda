module Data.Nat.Test.rshift where

open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.exp
import Data.Nat.rshift as N
open import Data.Nat.to-bits
open import Data.Bits.Type
import Data.Bits.rshift as B
open import Data.Bits.to-nat
open import Data.Bool.Type
open import Data.List.Type
open import Data.List.and
open import Data.List.map
open import Data.Pair.Type
open import Data.Equal.Type renaming (_==_ to _≡_)

-- Test case type
TestCase : Set
TestCase = Pair Nat Nat

-- List of test cases (number, shift amount)
test-cases : List TestCase
test-cases = (120 , 2) :: (65550 , 3) :: (16 , 1) :: (7 , 1) :: (0 , 4) :: (32 , 1) :: (2 ^ 32 , 8) :: []

-- Perform the test for a single case
test-rshift : TestCase → Bool
test-rshift (n , shift) =
  let nat-result = n N.>> shift
      bits-result = to-nat ((to-bits n) B.>> shift)
  in nat-result == bits-result

-- Run all tests
run-tests : List Bool
run-tests = map test-rshift test-cases

-- Check if all tests pass
all-tests-pass : Bool
all-tests-pass = and run-tests

_ : all-tests-pass ≡ True
_ = refl