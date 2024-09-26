module Base.BitMap.Test.new where

open import Base.BitMap.BitMap
open import Base.BitMap.new
open import Base.Equal.Equal
open import Base.Nat.Nat

test-new-map : new {Nat} ≡ Leaf
test-new-map = refl
