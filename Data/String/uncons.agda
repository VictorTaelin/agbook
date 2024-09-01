module Data.String.uncons where

open import Data.Char.Type
open import Data.Maybe.Type
open import Data.Sigma.Type
open import Data.String.Type

primitive
  primStringUncons : String → Maybe (Σ Char (λ _ → String))

-- Deconstructs a string into its first character and the rest.
-- - s: The input string.
-- = Just (first character, rest of the string) if the string is non-empty,
--   Nothing if the string is empty.
uncons : String → Maybe (Σ Char (λ _ → String))
uncons = primStringUncons
