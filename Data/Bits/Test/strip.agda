module Data.Bits.Test.strip where

open import Data.Bits.Type
open import Data.Bits.strip
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for strip function
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Bits → Bits → Set
test-case input expected =
  let result = strip input
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    -- Test empty bits
    _ : test-case E E
    _ = unit

    -- Test single bits
    _ : test-case (I E) (I E)
    _ = unit
    _ : test-case (O E) E
    _ = unit

    -- Test multiple bits
    _ : test-case (I (O E)) (I E)
    _ = unit
    _ : test-case (O (I E)) (O (I E))
    _ = unit
    _ : test-case (I (O (O E))) (I E)
    _ = unit
    _ : test-case (O (O (I E))) (O (O (I E)))
    _ = unit

    -- Test longer sequences
    _ : test-case (O (O (O (I (O (O E)))))) (O (O (O (I E))))
    _ = unit
    _ : test-case (I (O (O (O (O E))))) (I E)
    _ = unit
    _ : test-case (O (O (O (O E)))) E
    _ = unit

    _ : test-case (O (O (O (O (I (O (O (O E)))))))) (O (O (O (O (I E)))))
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
