module Base.Bool.andc- where

open import Base.Bool.Bool
open import Base.Bool.andc
open import Base.Bool.eq
open import Base.Equal.Equal

test-andc-true-false : andc True False ≡ True
test-andc-true-false = refl

test-andc-true-true : andc True True ≡ False
test-andc-true-true = refl

test-andc-false-true : andc False True ≡ False
test-andc-false-true = refl

test-andc-false-false : andc False False ≡ False
test-andc-false-false = refl

-- Demonstration of usage
demo-andc : Bool
demo-andc = andc True False

-- Expected result of demo
demo-andc-result : demo-andc ≡ True
demo-andc-result = refl

