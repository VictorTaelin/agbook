module Data.Bits.Test.rshift where

open import Data.Bits.Type
open import Data.Bits.rshift
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Nat.Type
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Nat → Bits → Set
test-case input shift expected =
  let result = input >> shift
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    -- Test with empty bits
    _ : test-case E 0 E
    _ = unit
    _ : test-case E 1 E
    _ = unit
    _ : test-case (I E) 0 (I E)
    _ = unit
    _ : test-case (I E) 1 E
    _ = unit
    _ : test-case (O (I E)) 1 (I E)
    _ = unit
    _ : test-case (I (O (I E))) 0 (I (O (I E)))
    _ = unit
    _ : test-case (I (O (I E))) 1 (O (I E))
    _ = unit
    _ : test-case (I (O (I E))) 2 (I E)
    _ = unit
    _ : test-case (I (O (I E))) 3 E
    _ = unit
    _ : test-case (from-nat 8) 1 (from-nat 4)
    _ = unit
    _ : test-case (from-nat 12) 2 (from-nat 3)
    _ = unit
    _ : test-case (from-nat 56) 3 (from-nat 7)
    _ = unit
    _ : test-case (from-nat 16) 4 (from-nat 1)
    _ = unit
    _ : test-case (from-nat 96) 5 (from-nat 3)
    _ = unit

  in unit

main : Unit
main = run-tests
