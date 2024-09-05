module Data.Bits.Test.pad-zeros where

open import Data.Bits.Type
open import Data.Bits.pad-zeros
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for pad-zeros
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Nat → Nat → Set
test-case n len =
  let result = pad-zeros len (from-nat n)
      expected = pad-zeros len (pad-zeros len (from-nat n))
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0
    _ = unit
    _ : test-case 1 1
    _ = unit
    _ : test-case 2 3
    _ = unit
    _ : test-case 7 4
    _ = unit
    _ : test-case 15 5
    _ = unit
    _ : test-case 42 8
    _ = unit
    _ : test-case 1042 12
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
