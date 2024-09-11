module Data.Float.Test.add where

open import Data.Float.Type
open import Data.Float.add
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.and
open import Data.Unit.Type
open import Data.Empty.Type

-- check if two floats are equal
equal : Float → Float → Bool
equal x y = primFloatLess (primFloatMinus x y) 0.000001 
         && primFloatLess (primFloatMinus y x) 0.000001

-- Test case
test-case : Float → Float → Float → Set
test-case a b expected =
    if equal (add a b) expected 
    then Unit 
    else Empty

-- Run cases
run-tests : Unit
run-tests =
    let
        _ : test-case 0.0 0.0 0.0
        _ = unit
        _ : test-case 1.0 1.0 2.0
        _ = unit
        _ : test-case 1.1 2.2 3.3
        _ = unit
        _ : test-case -1.2 -2.4 -3.6
        _ = unit 
        _ : test-case 10.0 -3.0 7.0
        _ = unit
    in unit

-- Main function to run tests
main : Unit
main = run-tests