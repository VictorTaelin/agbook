module Data.String.is-empty where

open import Data.Bool.Type
open import Data.String.Type
open import Data.List.Type
open import Data.Char.Type

primitive
  primStringToList : String → List Char

is-empty : String → Bool
is-empty s with primStringToList s
... | []       = True
... | (_ :: _) = False
