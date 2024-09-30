module Base.DiffList.empty where

open import Base.DiffList.DiffList
open import Base.List.List

-- Creates a new empty DiffList.
empty : ∀ {A : Set} → DiffList A
empty = λ tail → tail
