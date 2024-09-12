module Data.Nat.Test.eq where

open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-same : (42 == 42) === True
test-eq-same = refl

test-eq-different : (42 == 43) === False
test-eq-different = refl

test-eq-zero : (0 == 0) === True
test-eq-zero = refl

test-neq-same : (4 != 4) === False
test-neq-same = refl
