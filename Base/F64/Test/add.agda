module Base.F64.Test.add where

open import Base.F64.F64
open import Base.F64.add
open import Base.F64.lt
open import Base.F64.sub
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.and
open import Base.Unit.Unit
open import Base.Empty.Empty

-- check if two floats are equal
equal : F64 -> F64 -> Bool
equal x y = primFloatLess (primFloatMinus x y) 0.000001 
         && primFloatLess (primFloatMinus y x) 0.000001

-- Test case
test-case : F64 -> F64 -> F64 -> Set
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
