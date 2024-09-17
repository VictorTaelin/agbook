module Data.Map.Test.show where

open import Data.Map.Type
open import Data.Map.show
open import Data.Map.empty
open import Data.Map.set
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type
open import Data.String.Type
open import Data.Equal.Type
open import Data.Nat.show renaming (show to showN)

test-show-empty_map : show showN empty === "_"
test-show-empty_map = refl

test-show_single-element-map : show showN (set empty E 1) === "#1[_ _]"
test-show_single-element-map = refl

test-show-two-element-map : show showN (set (set empty E 1) (O E) 2) === "#1[#2[_ _] _]"
test-show-two-element-map = refl

test-show-three-element-map : show showN (set (set (set empty E 1) (O E) 2) (I E) 3) === "#1[#2[_ _] #3[_ _]]"
test-show-three_element-map = refl
