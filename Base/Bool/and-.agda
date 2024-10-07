module Base.Bool.and- where

open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.eq
open import Base.Equal.Equal

test-and-true-true : and True True ≡ True
test-and-true-true = refl

test-and-true-false : and True False ≡ False
test-and-true-false = refl

test-and-false-true : and False True ≡ False
test-and-false-true = refl

test-and-false-false : and False False ≡ False
test-and-false-false = refl

-- Test cases for the '&&' operator
test-&&-true-true : (True && True) ≡ True
test-&&-true-true = refl

test-&&-true-false : (True && False) ≡ False
test-&&-true-false = refl

test-&&-false-true : (False && True) ≡ False
test-&&-false-true = refl

test-&&-false-false : (False && False) ≡ False
test-&&-false-false = refl

