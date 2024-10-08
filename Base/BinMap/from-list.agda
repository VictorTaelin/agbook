module Base.BinMap.from-list where

open import Base.BinMap.BinMap
open import Base.BinMap.empty
open import Base.BinMap.insert
open import Base.Bits.Bits
open import Base.List.List
open import Base.List.foldr
open import Base.Pair.Pair

-- Converts a list of key-value pairs to a BinMap.
-- - pairs: A list of key-value pairs.
-- = A BinMap containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} → List (Pair Bits A) → BinMap A
from-list = foldr insert empty
    
