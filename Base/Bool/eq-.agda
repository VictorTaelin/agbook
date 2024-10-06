module Base.Bool.eq- where

open import Base.Bool.Bool
open import Base.Bool.eq
open import Base.Equal.Equal

test-eq-true-true : (True == True) ≡ True
test-eq-true-true = refl

test-eq-false-true : (False == True) ≡ False
test-eq-false-true = refl

