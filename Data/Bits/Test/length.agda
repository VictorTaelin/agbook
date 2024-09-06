module Data.Bits.Test.length where

open import Data.Bits.Type
open import Data.Bits.length
open import Data.Bits.from-nat
open import Data.Nat.Type
open import Data.Nat.eq renaming (_==_ to _n==_)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit length
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Bits → Nat → Set
test-case bits expected =
  let result = length bits
  in if result n== expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    -- Test empty bits
    _ : test-case E 0
    _ = unit

    -- Test single bit
    _ : test-case (O E) 1
    _ = unit
    _ : test-case (I E) 1
    _ = unit

    -- Test multi-bit
    _ : test-case (O (I E)) 2
    _ = unit
    _ : test-case (I (O (I E))) 3
    _ = unit

    -- Test with from-nat
    _ : test-case (from-nat 0) 1
    _ = unit
    _ : test-case (from-nat 1) 1
    _ = unit
    _ : test-case (from-nat 2) 2
    _ = unit
    _ : test-case (from-nat 4) 3
    _ = unit

    -- Test larger numbers
    _ : test-case (from-nat 8) 4
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
