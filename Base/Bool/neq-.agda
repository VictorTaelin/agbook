module Base.Bool.neq- where

open import Base.Bool.Bool
open import Base.Bool.neq
open import Base.Equal.Equal

test-eq-true-false : (True != False) ≡ True
test-eq-true-false = refl
