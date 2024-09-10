module Data.Bits.Test.div where

open import Data.Bits.Type
open import Data.Bits.div renaming (div to bDiv)
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Trait.Eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.div
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Nat → Set
test-case a b =
  let result = (from-nat a) / (from-nat b)
      expected = from-nat (div a b)
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    -- Basic cases
    _ : test-case 4 2
    _ = unit
    _ : test-case 9 3
    _ = unit
    _ : test-case 15 3
    _ = unit
    _ : test-case 0 1  -- Division by 1
    _ = unit
    _ : test-case 42 1  -- Division by 1
    _ = unit
    _ : test-case 0 5  -- Dividend is 0
    _ = unit
    _ : test-case 5 10  -- Divisor greater than dividend
    _ = unit
    _ : test-case 1000 7
    _ = unit
    _ : test-case 9999 111
    _ = unit
    _ : test-case 64 8
    _ = unit
    _ : test-case 1024 32
    _ = unit

  in unit

main : Unit
main = run-tests
