module Base.Nat.Test.rshift where

open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Nat.exp
import Base.Nat.rshift as N
open import Base.Nat.to-bits
open import Base.Bits.Bits
import Base.Bits.rshift as B
open import Base.Bits.to-nat
open import Base.Bool.Bool
open import Base.List.List
open import Base.List.and
open import Base.List.map
open import Base.Pair.Pair
open import Base.Equal.Equal 

-- Test case type
TestCase : Set
TestCase = Pair Nat Nat

-- List of test cases (number, shift amount)
test-cases : List TestCase
test-cases = (120 , 2) :: (65550 , 3) :: (16 , 1) :: (7 , 1) :: (0 , 4) :: (32 , 1) :: (2 ** 32 , 8) :: []

-- Perform the test for a single case
test-rshift : TestCase -> Bool
test-rshift (n , shift) =
  let nat-result = n N.>> shift
      bits-result = to-nat ((to-bits n) B.>> shift)
  in nat-result == bits-result

-- Run all tests
run-tests : List Bool
run-tests = map test-rshift test-cases

-- Check if all tests pass
all-tests-pass : Bool
all-tests-pass = and run-tests

_ : all-tests-pass  ≡  True
_ = refl
