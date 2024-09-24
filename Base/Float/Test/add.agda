module Base.Float.Test.add where

open import Base.Float.Type
open import Base.Float.add
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.and
open import Base.Unit.Type
open import Base.Empty.Type

-- check if two floats are equal
equal : Float -> Float -> Bool
equal x y = primFloatLess (primFloatMinus x y) 0.000001 
         && primFloatLess (primFloatMinus y x) 0.000001

-- Test case
test-case : Float -> Float -> Float -> Set
test-case a b expected =
    if equal (add a b) expected 
    then Unit 
    else Empty

-- Run cases
run-tests : Unit
run-tests = do
    let _ : test-case 0.0 0.0 0.0
        _ = unit
    let _ : test-case 1.0 1.0 2.0
        _ = unit
    let _ : test-case 1.1 2.2 3.3
        _ = unit
    let _ : test-case -1.2 -2.4 -3.6
        _ = unit 
    let _ : test-case 10.0 -3.0 7.0
        _ = unit
    unit

-- Main function to run tests
main : Unit
main = run-tests
