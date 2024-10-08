module Base.BinMap.Test.new where

open import Base.BinMap.BinMap
open import Base.BinMap.new
open import Base.Equal.Equal
open import Base.Nat.Nat

test-new-map : new {Nat} ≡ Leaf
test-new-map = refl
