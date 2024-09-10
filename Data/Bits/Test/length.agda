module Data.Bits.Test.length where

open import Data.Bits.Type
open import Data.Bits.length
open import Data.Bits.from-nat
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Trait.Eq renaming (_==_ to _n==_)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Bits → Nat → Set
test-case bits expected =
  let result = length bits
  in if result n== expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case E 0
    _ = unit
    _ : test-case (O E) 1
    _ = unit
    _ : test-case (I E) 1
    _ = unit
    _ : test-case (O (I E)) 2
    _ = unit
    _ : test-case (I (O (I E))) 3
    _ = unit
    _ : test-case (from-nat 0) 0
    _ = unit
    _ : test-case (from-nat 1) 1
    _ = unit
    _ : test-case (from-nat 2) 2
    _ = unit
    _ : test-case (from-nat 4) 3
    _ = unit
    _ : test-case (from-nat 8) 4
    _ = unit

  in unit

main : Unit
main = run-tests
