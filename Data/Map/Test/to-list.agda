module Data.Map.Test.to-list where

open import Data.Map.Type
open import Data.Map.to-list
open import Data.Map.empty
open import Data.Map.set
open import Data.List.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Equal.Type
open import Data.Bool.Type
open import Data.Maybe.Type

-- Test: Empty map should result in an empty list
test-empty-map : to-list empty === []
test-empty-map = refl

-- Test: Map with a single element
test-single-element : to-list (set empty E True) === (E , True) :: []
test-single-element = refl

test-overwrite-element : 
  to-list (set (set empty E True) E False) 
  === 
  (E , False) :: []
test-overwrite-element = refl

test-skip-none-values :
  to-list (Node None (Node (Some True) Leaf Leaf) (Node (Some False) Leaf Leaf))
  ===
  ((O E , True) :: ((I E , False) :: []))
test-skip-none-values = refl



