module Base.Map.from-list where

open import Base.Map.Type
open import Base.Map.empty
open import Base.Map.set
open import Base.List.Type
open import Base.List.foldr
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Bits.Type

-- Converts a list of key-value pairs to a Map.
-- - pairs: A list of key-value pairs.
-- = A Map containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} → List (Pair Bits A) → Map A
from-list = foldr insert empty
  where
    insert : ∀ {A : Set} → Pair Bits A → Map A → Map A
    insert pair m = set m (fst pair) (snd pair)
