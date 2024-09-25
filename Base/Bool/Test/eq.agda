module Base.Bool.Test.eq where

open import Base.Bool.Type
open import Base.Bool.eq
open import Base.Equal.Type

test-eq-true-true : (True == True) ≡ True
test-eq-true-true = refl

test-eq-false-true : (False == True) ≡ False
test-eq-false-true = refl

test-eq-true-false : (True != False) ≡ True
test-eq-true-false = refl
