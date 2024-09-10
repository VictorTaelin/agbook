module Data.Bits.Test.to-nat where

open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Class.Eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Nat → Set
test-case bits expected =
  let result = to-nat bits
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E 0
    _ = unit
    _ : test-case (O E) 0
    _ = unit
    _ : test-case (I E) 1
    _ = unit
    _ : test-case (O (I E)) 2
    _ = unit
    _ : test-case (I (O E)) 1
    _ = unit
    _ : test-case (I (I E)) 3
    _ = unit
    _ : test-case (O (O (I E))) 4
    _ = unit
    _ : test-case (I (O (I E))) 5
    _ = unit
    _ : test-case (O (I (I E))) 6
    _ = unit
    _ : test-case (I (I (I E))) 7
    _ = unit
    _ : test-case (O (O (O (I E)))) 8
    _ = unit
    _ : test-case (I (O (I (O (I E))))) 21
    _ = unit

  in unit

main : Unit
main = run-tests
