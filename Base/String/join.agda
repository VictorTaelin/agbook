module Base.String.join where

open import Base.Bool.if
open import Base.List.Type
open import Base.List.foldr
open import Base.String.Type
open import Base.String.append
open import Base.String.eq

-- Joins a list of strings with a separator.
-- - sep: The separator string.
-- - strs: The list of strings to join.
-- = A single string with all input strings concatenated, separated by sep.
join : String -> List String -> String
join sep = foldr (λ s acc -> if acc == "" then s else s ++ sep ++ acc) ""
