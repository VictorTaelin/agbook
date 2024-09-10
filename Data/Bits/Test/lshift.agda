module Data.Bits.Test.lshift where

open import Data.Bits.Type
open import Data.Bits.lshift
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Trait.Eq
open import Data.Nat.Type
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Nat → Bits → Set
test-case input shift expected =
  let result = input << shift
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E 0 E
    _ = unit
    _ : test-case E 1 E
    _ = unit
    _ : test-case (I E) 0 (I E)
    _ = unit
    _ : test-case (I E) 1 (O (I E))
    _ = unit
    _ : test-case (I E) 2 (O (O (I E)))
    _ = unit
    _ : test-case (I (O (I E))) 0 (I (O (I E)))
    _ = unit
    _ : test-case (I (O (I E))) 1 (O (I (O (I E))))
    _ = unit
    _ : test-case (I (O (I E))) 2 (O (O (I (O (I E)))))
    _ = unit
    _ : test-case (I (O (I E))) 3 (O (O (O (I (O (I E))))))
    _ = unit
    _ : test-case (from-nat 5) 1 (from-nat 10)
    _ = unit
    _ : test-case (from-nat 3) 2 (from-nat 12)
    _ = unit
    _ : test-case (from-nat 7) 3 (from-nat 56)
    _ = unit
    _ : test-case (from-nat 1) 4 (from-nat 16)
    _ = unit
    _ : test-case (from-nat 3) 5 (from-nat 96)
    _ = unit

  in unit

main : Unit
main = run-tests
