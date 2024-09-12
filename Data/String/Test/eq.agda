module Data.String.Test.eq where

open import Data.String.Type
open import Data.String.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-same-string : ("hello" == "hello") === True
test-eq-same-string = refl

test-eq-different-strings : ("hello" == "world") === False
test-eq-different-strings = refl

test-neq-different-strings : ("hello" != "world") === True
test-neq-different-strings = refl

test-eq-empty-strings : ("" == "") === True
test-eq-empty-strings = refl
