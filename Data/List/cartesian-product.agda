module Data.List.cartesian-product where

open import Data.List.Type
open import Data.List.cartesian-product-with
open import Data.Pair.Type

-- Returns the cartesian product of two lists.
cartesian-product : ∀ {A B : Set} → List A → List B → List (Pair A B)
cartesian-product = cartesian-product-with _,_
