module Data.DiffList.empty where

open import Data.DiffList.Type
open import Data.List.Type

-- Creates a new empty DiffList.
empty : ∀ {A : Set} → DiffList A
empty = λ tail → tail
