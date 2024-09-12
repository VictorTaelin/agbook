module Data.Char.Test.eq where

open import Data.Char.Type
open import Data.Char.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-a-a : ('a' == 'a') === True
test-eq-a-a = refl

test-eq-a-b : ('a' == 'b') === False
test-eq-a-b = refl

test-eq-0-0 : ('0' == '0') === True
test-eq-0-0 = refl
