module Base.BitMap.from-list where

open import Base.BitMap.BitMap
open import Base.BitMap.empty
open import Base.BitMap.insert
open import Base.Bits.Bits
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair

-- Converts a list of key-value pairs to a BitMap.
-- - pairs: A list of key-value pairs.
-- = A BitMap containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} → List (Pair Bits A) → BitMap A
from-list = foldr insert empty
    
