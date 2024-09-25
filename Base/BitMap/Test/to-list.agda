module Base.BitMap.Test.to-list where

open import Base.BitMap.Type
open import Base.BitMap.to-list
open import Base.BitMap.empty
open import Base.BitMap.set
open import Base.List.Type
open import Base.Pair.Type
open import Base.Bits.Type
open import Base.Equal.Type
open import Base.Bool.Type
open import Base.Maybe.Type

-- Test: Empty map should result in an empty list
test-empty-map : to-list empty ≡ []
test-empty-map = refl

-- Test: BitMap with a single element
test-single-element : to-list (set empty E True) ≡ (E , True) :: []
test-single-element = refl

test-overwrite-element : 
  to-list (set (set empty E True) E False) 
  ≡ 
  (E , False) :: []
test-overwrite-element = refl

test-skip-none-values :
  to-list (Node None (Node (Some True) Leaf Leaf) (Node (Some False) Leaf Leaf))
  ≡
  ((O E , True) :: ((I E , False) :: []))
test-skip-none-values = refl



