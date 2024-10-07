module Base.String.neq- where

open import Base.String.String
open import Base.String.neq
open import Base.Bool.Bool
open import Base.Equal.Equal

test-neq-same-string : ("hello" != "hello") ≡ False
test-neq-same-string = refl

test-neq-different-strings : ("hello" != "world") ≡ True
test-neq-different-strings = refl

test-neq-empty-strings : ("" != "") ≡ False
test-neq-empty-strings = refl
