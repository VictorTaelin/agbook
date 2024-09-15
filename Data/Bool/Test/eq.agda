module Data.Bool.Test.eq where

open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type

test-eq-true-true : (True == True) === True
test-eq-true-true = refl

test-eq-false-true : (False == True) === False
test-eq-false-true = refl

test-eq-true-false : (True != False) === True
test-eq-true-false = refl
