module Data.Bits.Test.mod where

open import Data.Bits.Type
open import Data.Bits.mod
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.eq renaming (_==_ to _n==_)
open import Data.Nat.mod renaming (mod to mod-nat; _%_ to _%n_)
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Nat → Set
test-case a b =
  let result = to-nat ((from-nat a) % (from-nat b))
      expected = a %n b
  in if ((to-nat (from-nat result)) n== (to-nat (from-nat expected))) then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 2 1
    _ = unit
    _ : test-case 15 4
    _ = unit
    _ : test-case 7 2
    _ = unit
    _ : test-case 20 6
    _ = unit
    _ : test-case 100 8
    _ = unit
    _ : test-case 42 5
    _ = unit
    _ : test-case 0 5
    _ = unit
    _ : test-case 17 17
    _ = unit
    _ : test-case 1024 10
    _ = unit
    _ : test-case 9999 100
    _ = unit

  in unit

main : Unit
main = run-tests
