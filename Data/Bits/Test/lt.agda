module Data.Bits.Test.lt where

open import Data.Bits.Type
open import Data.Bits.lt
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
  let result = (from-nat a) < (from-nat b)
  in if result == expected then Unit else Empty

run-tests : Unit
run-tests = 
  let
    _ : test-case 0 0 False
    _ = unit
    _ : test-case 1 0 False
    _ = unit
    _ : test-case 0 1 True
    _ = unit
    _ : test-case 2 1 False
    _ = unit
    _ : test-case 1 2 True
    _ = unit
    _ : test-case 7 8 True
    _ = unit
    _ : test-case 8 7 False
    _ = unit
    _ : test-case 15 16 True
    _ = unit
    _ : test-case 16 15 False
    _ = unit
    _ : test-case 42 42 False
    _ = unit
    _ : test-case 1042 58 False
    _ = unit
    _ : test-case 0 255 True
    _ = unit
    _ : test-case 255 0 False
    _ = unit
    _ : test-case 1 255 True
    _ = unit
    _ : test-case 254 255 True
    _ = unit

  in unit

main : Unit
main = run-tests
