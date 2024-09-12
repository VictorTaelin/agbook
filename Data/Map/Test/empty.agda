module Data.Map.Test.empty where

open import Data.Map.Type
open import Data.Map.empty
open import Data.Equal.Type
open import Data.Nat.Type

test-empty-map : empty {Nat} === Leaf
test-empty-map = refl


