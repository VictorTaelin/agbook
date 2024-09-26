module Base.BitMap.Test.empty where

open import Base.BitMap.BitMap
open import Base.BitMap.empty
open import Base.Equal.Equal
open import Base.Nat.Nat

test-empty-map : empty {Nat} ≡ Leaf
test-empty-map = refl


