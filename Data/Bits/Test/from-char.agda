module Data.Bits.Test.from-char where

open import Data.Bits.Type
open import Data.Bits.from-char
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Char.Type
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for character to bits conversion
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Char → Bits → Set
test-case char expected =
  let result = from-char char
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case 'A' (O (I (O (O (O (O (I E)))))))
    _ = unit
    _ : test-case 'a' (I (O (O (O (O (I (I E)))))))
    _ = unit
    _ : test-case '0' (O (O (O (O (I (I (O E)))))))
    _ = unit
    _ : test-case '9' (I (O (O (I (I (O (O E)))))))
    _ = unit
    _ : test-case '!' (I (O (O (O (O (O (O E)))))))
    _ = unit
    _ : test-case '~' (I (I (I (I (O (I (I E)))))))
    _ = unit
  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
