module Base.String.Test.eq where

open import Base.String.String
open import Base.String.eq
open import Base.Bool.Bool
open import Base.Equal.Equal

test-eq-same-string : ("hello" == "hello") ≡ True
test-eq-same-string = refl

test-eq-different-strings : ("hello" == "world") ≡ False
test-eq-different-strings = refl

test-neq-different-strings : ("hello" != "world") ≡ True
test-neq-different-strings = refl

test-eq-empty-strings : ("" == "") ≡ True
test-eq-empty-strings = refl
