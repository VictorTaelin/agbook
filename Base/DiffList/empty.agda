module Base.DiffList.empty where

open import Base.DiffList.Type
open import Base.List.Type

-- Creates a new empty DiffList.
empty : ∀ {A : Set} -> DiffList A
empty = λ tail -> tail
