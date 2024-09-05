module Data.List.intercalate where

open import Data.List.Type
open import Data.List.append

-- Intercalates a list into a list of lists.
intercalate : ∀ {A : Set} → List A → List (List A) → List A
intercalate xs [] = []
intercalate xs (ys :: []) = ys
intercalate xs (ys :: yss) = ys ++ xs ++ intercalate xs yss
