module Data.String.head where

open import Data.String.Type
open import Data.String.to-list
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.List.Type

head : String → Maybe Char
head s with to-list s
... | []       = None
... | (c :: _) = Some c
