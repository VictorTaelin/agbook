module Base.BinMap.Test.show where

open import Base.BinMap.BinMap
open import Base.BinMap.show
open import Base.BinMap.empty
open import Base.BinMap.set
open import Base.Bits.Bits
open import Base.Maybe.Maybe
open import Base.BinTree.BinTree
open import Base.String.String
open import Base.Equal.Equal
open import Base.Nat.show renaming (show to showN)

test-show-empty_map : show showN empty ≡ "_"
test-show-empty_map = refl

test-show_single-element-map : show showN (set empty E 1) ≡ "#1[_ _]"
test-show_single-element-map = refl

test-show-two-element-map : show showN (set (set empty E 1) (O E) 2) ≡ "#1[#2[_ _] _]"
test-show-two-element-map = refl

test-show-three-element-map : show showN (set (set (set empty E 1) (O E) 2) (I E) 3) ≡ "#1[#2[_ _] #3[_ _]]"
test-show-three-element-map = refl
