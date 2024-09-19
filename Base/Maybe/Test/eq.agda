module Base.Maybe.Test.eq where

open import Base.Maybe.Type
open import Base.Maybe.eq
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Bool.Type
open import Base.Equal.Type

test-eq-some-equal : ((Some 42) == (Some 42)) === True
test-eq-some-equal = refl

test-eq-some-different : ((Some 42) == (Some 43)) === False
test-eq-some-different = refl

test-eq-none : (None == None) === True
test-eq-none = refl

test-eq-some-none : ((Some 42) == None) === False
test-eq-some-none = refl
