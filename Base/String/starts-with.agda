module Base.String.starts-with where

import Base.List.starts-with
open import Base.Bool.Type
open import Base.Char.Type
open import Base.Char.Trait.Eq
open import Base.List.Type
open import Base.String.Type
open import Base.String.to-list

-- Checks if the first string starts with the second string.
-- Returns True if str starts with prefix, False otherwise.
starts-with : String -> String -> Bool
starts-with str prefix = Base.List.starts-with.starts-with {{EqChar}} (to-list prefix) (to-list str)
