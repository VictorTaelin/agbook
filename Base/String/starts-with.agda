module Base.String.starts-with where

import Base.List.starts-with
open import Base.Bool.Bool
open import Base.Char.Trait.Eq
open import Base.Char.Char
open import Base.List.List
open import Base.String.String
open import Base.String.to-list

-- Checks if one string starts with another.
-- - 1st: The string to check.
-- - 2nd: The prefix to look for.
-- = True if the first string starts with the second string, False otherwise.
starts-with : String → String → Bool
starts-with str prefix = Base.List.starts-with.starts-with {{EqChar}} (to-list prefix) (to-list str)
