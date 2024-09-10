module Data.String.join where

open import Data.Bool.if
open import Data.List.Type
open import Data.List.foldr
open import Data.String.Type
open import Data.String.append
open import Data.String.eq
open import Data.Class.Eq

-- Joins a list of strings with a separator.
-- - sep: The separator string.
-- - strs: The list of strings to join.
-- = A single string with all input strings concatenated, separated by sep.
join : String → List String → String
join sep = foldr (λ s acc → if acc == "" then s else acc ++ sep ++ s) ""
