module Data.Bits.Test.sub where

open import Data.Bits.Type
open import Data.Bits.sub
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.sub renaming (sub to sub-nat; _-_ to _-n_)
open import Data.Nat.lt
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit subtraction
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Nat → Nat → Set
test-case a b =
  let result = (from-nat a) - (from-nat b)
      expected = from-nat (if a < b then 0 else a -n b)
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    -- Basic cases
    _ : test-case 0 0
    _ = unit
    _ : test-case 1 1
    _ = unit
    _ : test-case 5 3
    _ = unit
    _ : test-case 10 7
    _ = unit
    
    -- Corner cases
    _ : test-case 0 1  -- Subtracting from zero
    _ = unit
    _ : test-case 1 0  -- Subtracting zero
    _ = unit
    _ : test-case 100 100  -- Subtracting equal numbers
    _ = unit
    
    -- Larger numbers
    _ : test-case 1000 1
    _ = unit
    _ : test-case 9999 9998
    _ = unit
    
    -- Cases where subtrahend is larger than minuend
    _ : test-case 5 10
    _ = unit
    _ : test-case 100 200
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
