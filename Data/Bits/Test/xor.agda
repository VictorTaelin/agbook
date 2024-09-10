module Data.Bits.Test.xor where

open import Data.Bits.Type
open import Data.Bits.xor
open import Data.Bits.eq
open import Data.Class.Eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Bits → Bits → Set
test-case a b expected =
  let result = a ^ b
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E E E
    _ = unit
    _ : test-case (O E) (O E) (O E)
    _ = unit
    _ : test-case (O E) (I E) (I E)
    _ = unit
    _ : test-case (I E) (O E) (I E)
    _ = unit
    _ : test-case (I E) (I E) (O E)
    _ = unit
    _ : test-case (I (O (I E))) (I (I (O E))) (O (I (I E)))
    _ = unit
    _ : test-case (I (O (I (I E)))) (I (I (O (I E)))) (O (I (I (O E))))
    _ = unit
    _ : test-case (O (I (O (I E)))) (I (O (I (O E)))) (I (I (I (I E))))
    _ = unit
    _ : test-case (I (I (I (I E)))) (I (O (I (O E)))) (O (I (O (I E))))
    _ = unit
    _ : test-case (I (O (I (O (I E))))) (I (I (O (I (I E))))) (O (I (I (I (O E)))))
    _ = unit

  in unit

main : Unit
main = run-tests
