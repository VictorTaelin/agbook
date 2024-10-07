module Base.Bool.orc- where 

open import Base.Bool.Bool
open import Base.Bool.orc
open import Base.Equal.Equal

-- Test cases
test-orc-false-false : orc False False ≡ True
test-orc-false-false = refl

test-orc-false-true : orc False True ≡ False
test-orc-false-true = refl

test-orc-true-false : orc True False ≡ True
test-orc-true-false = refl

test-orc-true-true : orc True True ≡ True
test-orc-true-true = refl

-- Demonstration of usage
demo-orc : Bool
demo-orc = orc True False

-- Expected result of demo
demo-orc-result : demo-orc ≡ True
demo-orc-result = refl

