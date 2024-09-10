module Data.Bits.Test.mul where

open import Data.Bits.Type
open import Data.Bits.mul
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Bits.eq
open import Data.Trait.Eq
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.mul renaming (mul to mul-nat; _*_ to _*n_)
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Nat → Set
test-case a b =
  let result = (from-nat a) * (from-nat b)
      expected = from-nat (a *n b)
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    -- Corner cases
    _ : test-case 0 0
    _ = unit
    _ : test-case 0 1
    _ = unit
    _ : test-case 1 0
    _ = unit
    _ : test-case 1 1
    _ = unit
    _ : test-case 2 3
    _ = unit
    _ : test-case 4 5
    _ = unit
    _ : test-case 7 8
    _ = unit
    _ : test-case 15 16
    _ = unit
    _ : test-case 42 58
    _ = unit
    _ : test-case 100 100
    _ = unit
    _ : test-case 16 16
    _ = unit
    _ : test-case 32 8
    _ = unit
    _ : test-case 17 19
    _ = unit
    _ : test-case 23 29
    _ = unit
    _ : test-case 1000 7
    _ = unit
    _ : test-case 9 999
    _ = unit

  in unit

main : Unit
main = run-tests
