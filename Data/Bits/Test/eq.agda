module Data.Bits.Test.eq where

open import Data.Bits.Type
open import Data.Bits.eq
open import Data.Bits.not
open import Data.Bits.or
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Bits → Bool → Set
test-case a b expected = 
  let result = a == b
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E E True
    _ = unit
    _ : test-case (O E) (O E) True
    _ = unit
    _ : test-case (I E) (I E) True
    _ = unit
    _ : test-case (O E) (I E) False
    _ = unit
    _ : test-case (O (I E)) (O (I E)) True
    _ = unit
    _ : test-case (I (O (I E))) (I (O (I E))) True
    _ = unit
    _ : test-case (O (I (O E))) (O (I (I E))) False
    _ = unit
    _ : test-case (O (I E)) (O (I (O E))) False
    _ = unit
    _ : test-case (I (O E)) (I E) False
    _ = unit
    _ : test-case (O (I E)) (~ (I (O E))) True
    _ = unit
    _ : test-case (I (I E)) ((O (I E)) || (I (O E))) True
    _ = unit
    _ : test-case (O E) E False
    _ = unit
    _ : test-case E (I E) False
    _ = unit

  in unit

main : Unit
main = run-tests
