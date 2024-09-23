module Base.BitMap.Test.empty where

open import Base.BitMap.Type
open import Base.BitMap.empty
open import Base.Equal.Type
open import Base.Nat.Type

test-empty-map : empty {Nat} === Leaf
test-empty-map = refl


