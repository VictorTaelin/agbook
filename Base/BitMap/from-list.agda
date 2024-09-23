module Base.BitMap.from-list where

open import Base.BitMap.Type
open import Base.BitMap.empty
open import Base.BitMap.insert
open import Base.Bits.Type
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type

-- Converts a list of key-value pairs to a BitMap.
-- - pairs: A list of key-value pairs.
-- = A BitMap containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} -> List (Pair Bits A) -> BitMap A
from-list = foldr insert empty
    
