module Data.List.cartesian-product-with where

open import Data.List.Type
open import Data.List.map
open import Data.List.append
open import Data.Pair.Type

-- Returns the cartesian products of two lists applied by a given function.
cartesian-product-with : ∀ {A B C : Set} → (A → B → C) → List A → List B → List C
cartesian-product-with f [] _ = []
cartesian-product-with f (x :: xs) ys = map (f x) ys ++ cartesian-product-with f xs ys
