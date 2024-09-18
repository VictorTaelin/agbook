module Base.Map.Test.empty where

open import Base.Map.Type
open import Base.Map.empty
open import Base.Equal.Type
open import Base.Nat.Type

test-empty-map : empty {Nat} === Leaf
test-empty-map = refl


