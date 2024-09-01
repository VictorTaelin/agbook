module Data.String.from-char where

open import Data.Char.Type
open import Data.String.Type
open import Data.List.Type
open import Data.String.from-list

-- Converts a character to a string
from-char : Char → String
from-char c = from-list (c :: [])
