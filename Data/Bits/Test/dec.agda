module Data.Bits.Test.dec where

open import Data.Bits.Type
open import Data.Bits.dec
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.sub renaming (sub to sub-nat; _-_ to _-n_)
open import Data.Unit.Type
open import Data.Empty.Type

-- Test case for bit decrement
-- If the test passes, it returns Unit. If it fails, it returns Empty.
test-case : Nat → Set
test-case n =
  let result = dec (from-nat n)
      expected = from-nat (n -n 1)
  in if result == expected then Unit else Empty

-- Run multiple test cases
-- This will only type check if all tests pass
run-tests : Unit
run-tests = 
  let
    _ : test-case 1
    _ = unit
    _ : test-case 2
    _ = unit
    _ : test-case 3
    _ = unit
    _ : test-case 8
    _ = unit
    _ : test-case 16
    _ = unit
    _ : test-case 42
    _ = unit
    _ : test-case 100
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests
