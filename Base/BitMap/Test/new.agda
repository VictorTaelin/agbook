module Base.BitMap.Test.new where

open import Base.BitMap.Type
open import Base.BitMap.new
open import Base.Equal.Type
open import Base.Nat.Type

test-new-map : new {Nat} ≡ Leaf
test-new-map = refl
