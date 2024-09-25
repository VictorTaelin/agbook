module Base.String.Test.eq where

open import Base.String.Type
open import Base.String.eq
open import Base.Bool.Type
open import Base.Equal.Type

test-eq-same-string : ("hello" == "hello") ≡ True
test-eq-same-string = refl

test-eq-different-strings : ("hello" == "world") ≡ False
test-eq-different-strings = refl

test-neq-different-strings : ("hello" != "world") ≡ True
test-neq-different-strings = refl

test-eq-empty-strings : ("" == "") ≡ True
test-eq-empty-strings = refl
