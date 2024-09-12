module Data.Bits.Test.not where

open import Data.Bits.Type
open import Data.Bits.not
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Bits → Set
test-case input expected =
  let result = not input
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E E
    _ = unit
    _ : test-case (O E) (I E)
    _ = unit
    _ : test-case (I E) (O E)
    _ = unit
    _ : test-case (I (O (I E))) (O (I (O E)))
    _ = unit
    _ : test-case (O (I (O E))) (I (O (I E)))
    _ = unit
    _ : test-case (I (I (I E))) (O (O (O E)))
    _ = unit
    _ : test-case (I (O (I (O (I E))))) (O (I (O (I (O E)))))
    _ = unit
    _ : test-case (O (O (O (O (O E))))) (I (I (I (I (I E)))))
    _ = unit

  in unit

main : Unit
main = run-tests
