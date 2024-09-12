module Data.Bits.Test.add where

open import Data.Bits.Type
open import Data.Bits.add
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.add renaming (add to add-nat; _+_ to _+n_)
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Nat → Set
test-case a b =
  let result = (from-nat a) + (from-nat b)
      expected = from-nat (a +n b)
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0
    _ = unit
    _ : test-case 1 1
    _ = unit
    _ : test-case 2 3
    _ = unit
    _ : test-case 7 8
    _ = unit
    _ : test-case 15 16
    _ = unit
    _ : test-case 42 58
    _ = unit
    _ : test-case 1042 58
    _ = unit

  in unit

-- Main function to run tests
-- This will only type check if all tests pass
main : Unit
main = run-tests


