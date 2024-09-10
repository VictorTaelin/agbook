module Data.Bits.Test.show where

open import Data.Bits.Type
open import Data.Bits.show
open import Data.String.Type
open import Data.String.eq
open import Data.Trait.Eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → String → Set
test-case bits expected =
  if (show bits) == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E "e"
    _ = unit
    _ : test-case (O E) "0e"
    _ = unit
    _ : test-case (I E) "1e"
    _ = unit
    _ : test-case (I (O E)) "10e"
    _ = unit
    _ : test-case (O (I E)) "01e"
    _ = unit
    _ : test-case (I (O (I E))) "101e"
    _ = unit
    _ : test-case (O (O (I E))) "001e"
    _ = unit

  in unit

main : Unit
main = run-tests
