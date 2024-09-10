module Data.Bits.Test.from-nat where

open import Data.Bits.Type
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Trait.Eq
open import Data.Nat.Type
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Bits → Set
test-case n expected =
  let result = from-nat n
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 0 (E)
    _ = unit
    _ : test-case 1 (I E)
    _ = unit
    _ : test-case 2 (O (I E))
    _ = unit
    _ : test-case 3 (I (I E))
    _ = unit
    _ : test-case 4 (O (O (I E)))
    _ = unit
    _ : test-case 5 (I (O (I E)))
    _ = unit
    _ : test-case 8 (O (O (O (I E))))
    _ = unit

  in unit

main : Unit
main = run-tests
