module Base.DiffList.Type where

open import Base.List.Type

DiffList : Set → Set
DiffList A = List A → List A
