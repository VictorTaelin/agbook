module Base.Bool.Trait.Eq- where

open import Base.Bool.Bool
open import Base.Bool.Trait.Eq
open import Base.Equal.Equal
open import Base.Trait.Eq

test-eq-trait-true-true : (True == True) ≡ True
test-eq-trait-true-true = refl

test-eq-trait-false-false : (False == False) ≡ True
test-eq-trait-false-false = refl

test-eq-trait-true-false : (True == False) ≡ False
test-eq-trait-true-false = refl

test-eq-trait-false-true : (False == True) ≡ False
test-eq-trait-false-true = refl
