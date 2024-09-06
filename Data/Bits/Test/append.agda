module Data.Bits.Test.append where

open import Data.Bits.Type
open import Data.Bits.append
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit appending
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Bits → Bits → Bits → Set
test-case a b expected =
  let result = a ++ b
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case E E E
    _ = unit
    _ : test-case (O E) (I E) (O (I E))
    _ = unit
    _ : test-case (I E) (O E) (I (O E))
    _ = unit
    _ : test-case (O (I E)) (I (O E)) (O (I (I (O E))))
    _ = unit
    _ : test-case (I (O (I E))) (O (I (O E))) (I (O (I (O (I (O E))))))
    _ = unit
    _ : test-case (O (O (O (I E)))) (I (I (I E))) (O (O (O (I (I (I (I E)))))))
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
