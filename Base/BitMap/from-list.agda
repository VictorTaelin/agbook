module Base.BitMap.from-list where

open import Base.BitMap.Type
open import Base.BitMap.empty
open import Base.BitMap.set
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Bits.Type

-- Converts a list of key-value pairs to a BitMap.
-- - pairs: A list of key-value pairs.
-- = A BitMap containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} → List (Pair Bits A) → BitMap A
from-list = foldr insert empty
  where
    insert : ∀ {A : Set} → Pair Bits A → BitMap A → BitMap A
    insert pair m = set m (fst pair) (snd pair)
