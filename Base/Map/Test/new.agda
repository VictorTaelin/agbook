module Base.Map.Test.new where

open import Base.Map.Type
open import Base.Map.new
open import Base.Equal.Type
open import Base.Nat.Type

test-new-map : new {Nat} === Leaf
test-new-map = refl
