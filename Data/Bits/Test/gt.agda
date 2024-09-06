module Data.Bits.Test.gt where

open import Data.Bits.Type
open import Data.Bits.gt
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.eq renaming (_==_ to _b==_)
open import Data.Nat.Type
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit greater than comparison
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Nat → Nat → Bool → Set
test-case a b expected =
  let result = (from-nat a) > (from-nat b)
  in if result b== expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0 False
    _ = unit
    _ : test-case 1 0 True
    _ = unit
    _ : test-case 0 1 False
    _ = unit
    _ : test-case 2 1 True
    _ = unit
    _ : test-case 1 2 False
    _ = unit
    _ : test-case 7 8 False
    _ = unit
    _ : test-case 8 7 True
    _ = unit
    _ : test-case 15 16 False
    _ = unit
    _ : test-case 16 15 True
    _ = unit
    _ : test-case 42 42 False
    _ = unit
    _ : test-case 1042 58 True
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
