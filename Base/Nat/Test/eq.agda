module Base.Nat.Test.eq where

open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Bool.Type
open import Base.Equal.Type

test-eq-same : (42 == 42) === True
test-eq-same = refl

test-eq-different : (42 == 43) === False
test-eq-different = refl

test-eq-zero : (0 == 0) === True
test-eq-zero = refl

test-neq-same : (4 != 4) === False
test-neq-same = refl
