module Data.Bits.Test.reverse where

open import Data.Bits.Type
open import Data.Bits.reverse
open import Data.Bits.eq
open import Data.Trait.Eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Bits → Set
test-case input expected =
  let result = reverse input
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E E
    _ = unit
    _ : test-case (O E) (O E)
    _ = unit
    _ : test-case (I E) (I E)
    _ = unit
    _ : test-case (O (I E)) (I (O E))
    _ = unit
    _ : test-case (I (O E)) (O (I E))
    _ = unit
    _ : test-case (O (I (O E))) (O (I (O E)))
    _ = unit
    _ : test-case (I (O (I E))) (I (O (I E)))
    _ = unit
    _ : test-case (O (O (I (I E)))) (I (I (O (O E))))
    _ = unit
    _ : test-case (O (O (O (I E)))) (I (O (O (O E))))
    _ = unit
    _ : test-case (I (I (O (O E)))) (O (O (I (I E))))
    _ = unit

  in unit

main : Unit
main = run-tests
