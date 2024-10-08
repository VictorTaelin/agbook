module Base.BinMap.Test.empty where

open import Base.BinMap.BinMap
open import Base.BinMap.empty
open import Base.Equal.Equal
open import Base.Nat.Nat

test-empty-map : empty {Nat} ≡ Leaf
test-empty-map = refl


