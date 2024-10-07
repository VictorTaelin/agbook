module Base.Bool.if- where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test cases for the 'if_then_else_' function

-- Test with boolean results
test-if-true-bool : (if True then True else False) ≡ True
test-if-true-bool = refl

test-if-false-bool : (if False then True else False) ≡ False
test-if-false-bool = refl

-- Test with natural number results
test-if-true-nat : (if True then 1 else 0) ≡ 1
test-if-true-nat = refl

test-if-false-nat : (if False then 1 else 0) ≡ 0
test-if-false-nat = refl

-- Test with nested if-then-else
test-if-nested : (if True then (if False then 1 else 2) else 3) ≡ 2
test-if-nested = refl

