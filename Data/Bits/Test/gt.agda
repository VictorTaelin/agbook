module Data.Bits.Test.gt where

open import Data.Bits.Type
open import Data.Bits.gt
open import Data.Bits.from-nat
open import Data.Bits.eq
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.eq 
open import Data.Nat.Type
open import Data.Unit.Type
open import Data.Empty.Type

test-case : Nat → Nat → Bool → Set
test-case a b expected =
  let result = (from-nat a) > (from-nat b)
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0 False
    _ = unit
    _ : test-case 1 0 True
    _ = unit
    _ : test-case 0 1 False
    _ = unit
    _ : test-case 2 1 True
    _ = unit
    _ : test-case 1 2 False
    _ = unit
    _ : test-case 7 8 False
    _ = unit
    _ : test-case 8 7 True
    _ = unit
    _ : test-case 15 16 False
    _ = unit
    _ : test-case 16 15 True
    _ = unit
    _ : test-case 42 42 False
    _ = unit
    _ : test-case 1042 58 True
    _ = unit

  in unit

main : Unit
main = run-tests
