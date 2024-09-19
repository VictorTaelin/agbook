module Base.Map.Test.show where

open import Base.Map.Type
open import Base.Map.show
open import Base.Map.empty
open import Base.Map.set
open import Base.Bits.Type
open import Base.Maybe.Type
open import Base.Tree.Type
open import Base.String.Type
open import Base.Equal.Type
open import Base.Nat.show renaming (show to showN)

test-show-empty_map : show showN empty === "_"
test-show-empty_map = refl

test-show_single-element-map : show showN (set empty E 1) === "#1[_ _]"
test-show_single-element-map = refl

test-show-two-element-map : show showN (set (set empty E 1) (O E) 2) === "#1[#2[_ _] _]"
test-show-two-element-map = refl

test-show-three-element-map : show showN (set (set (set empty E 1) (O E) 2) (I E) 3) === "#1[#2[_ _] #3[_ _]]"
test-show-three-element-map = refl
