module Data.Map.from-list where

open import Data.Map.Type
open import Data.Map.empty
open import Data.Map.set
open import Data.List.Type
open import Data.List.foldr
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd
open import Data.Bits.Type

-- insert helper
insert : ∀ {A : Set} → Pair Bits A → Map A → Map A
insert pair m = set m (fst pair) (snd pair)

-- Converts a list of key-value pairs to a Map.
-- - pairs: A list of key-value pairs.
-- = A Map containing all the key-value pairs from the input list.
from-list : ∀ {A : Set} → List (Pair Bits A) → Map A
from-list = foldr insert empty
