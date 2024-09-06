module Data.Bits.Test.concat where

open import Data.Bits.Type
open import Data.Bits.concat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type
open import Data.List.Type
open import Data.List.append

test-case : List Bits → Bits → Set
test-case input expected =
  let result = concat input
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case [] E
    _ = unit
    _ : test-case (E :: []) E
    _ = unit
    _ : test-case (O E :: I E :: []) (O (I E))
    _ = unit
    _ : test-case (I E :: O E :: []) (I (O E))
    _ = unit
    _ : test-case (O (I E) :: I (O E) :: []) (O (I (I (O E))))
    _ = unit
    _ : test-case (I (O (I E)) :: O (I (O E)) :: []) (I (O (I (O (I (O E))))))
    _ = unit
    _ : test-case (O (O (O (I E))) :: I (I (I E)) :: []) (O (O (O (I (I (I (I E)))))))
    _ = unit

  in unit

main : Unit
main = run-tests
