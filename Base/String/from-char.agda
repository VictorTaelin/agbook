module Base.String.from-char where

open import Base.Char.Type
open import Base.String.Type
open import Base.List.Type
open import Base.String.from-list

-- Converts a character to a string
from-char : Char → String
from-char c = from-list (c :: [])
