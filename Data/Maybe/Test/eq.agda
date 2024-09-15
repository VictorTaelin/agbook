module Data.Maybe.Test.eq where

open import Data.Maybe.Type
open import Data.Maybe.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-some-equal : ((Some 42) == (Some 42)) === True
test-eq-some-equal = refl

test-eq-some-different : ((Some 42) == (Some 43)) === False
test-eq-some-different = refl

test-eq-none : (None == None) === True
test-eq-none = refl

test-eq-some-none : ((Some 42) == None) === False
test-eq-some-none = refl
