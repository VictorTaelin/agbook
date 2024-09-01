module Data.String.head where

open import Data.String.Type
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.List.Type

primitive
  primStringToList : String → List Char

head : String → Maybe Char
head s with primStringToList s
... | []       = None
... | (c :: _) = Some c
