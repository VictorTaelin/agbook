module Data.DiffList.Type where

open import Data.List.Type

DiffList : Set → Set
DiffList A = List A → List A
