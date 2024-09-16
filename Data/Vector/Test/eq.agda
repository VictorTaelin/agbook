module Data.Vector.Test.eq where

open import Data.Vector.Type
open import Data.Vector.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Equal.Type

test-eq-neq-different-element : ((1 :: 2 :: 3 :: []) != (1 :: 2 :: 4 :: [])) === True
test-eq-neq-different-element = refl

test-eq-neq-empty-vectors : ([] != ([] {A = Nat})) === False
test-eq-neq-empty-vectors = refl

test-eq-same-vectors : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
test-eq-same-vectors = refl

test-eq-different-vectors : ((1 :: 2 :: []) == (1 :: 3 :: [])) === False
test-eq-different-vectors = refl
