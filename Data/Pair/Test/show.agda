module Data.Pair.Test.show where

open import Data.Pair.Type
open import Data.Pair.show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Bool.Type
open import Data.Bool.show
open import Data.String.Type
open import Data.Equal.Type

test-show-nat-bool : show (1 , True) === "(1, true)"
test-show-nat-bool = refl

test-show-nat-bool-2 : show (42 , False) === "(42, false)"
test-show-nat-bool-2 = refl

test-show-nat-nat : show (1 , 1) === "(1, 1)"
test-show-nat-nat = refl