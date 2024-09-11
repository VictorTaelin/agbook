module Data.Map.Test.new where

open import Data.Map.Type
open import Data.Map.new
open import Data.Equal.Type
open import Data.Nat.Type

test-new-map : new {Nat} == Leaf
test-new-map = refl
