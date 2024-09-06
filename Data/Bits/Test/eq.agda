module Data.Bits.Test.eq where

open import Data.Bits.Type
open import Data.Bits.eq
open import Data.Bits.not
open import Data.Bits.or
open import Data.Bool.Type
open import Data.Bool.eq renaming (_==_ to _b==_)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit equality
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Bits → Bits → Bool → Set
test-case a b expected =
  let result = a == b
  in if result b== expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    -- Test empty bits
    _ : test-case E E True
    _ = unit

    -- Test single bit equality
    _ : test-case (O E) (O E) True
    _ = unit
    _ : test-case (I E) (I E) True
    _ = unit
    _ : test-case (O E) (I E) False
    _ = unit

    -- Test multi-bit equality
    _ : test-case (O (I E)) (O (I E)) True
    _ = unit
    _ : test-case (I (O (I E))) (I (O (I E))) True
    _ = unit
    _ : test-case (O (I (O E))) (O (I (I E))) False
    _ = unit

    -- Test with different length bits
    _ : test-case (O (I E)) (O (I (O E))) False
    _ = unit
    _ : test-case (I (O E)) (I E) False
    _ = unit

    -- Test with not operation
    _ : test-case (O (I E)) (~ (I (O E))) True
    _ = unit

    -- Test with or operation
    _ : test-case (I (I E)) ((O (I E)) || (I (O E))) True
    _ = unit

    -- Corner case: comparing with E
    _ : test-case (O E) E False
    _ = unit
    _ : test-case E (I E) False
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
