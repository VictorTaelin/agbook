module Data.List.zip where

open import Data.List.Type
open import Data.List.zip-with
open import Data.Pair.Type

-- Zips two lists into a single list of pairs.
zip : ∀ {A B : Set} → List A → List B → List (Pair A B)
zip = zip-with _,_
