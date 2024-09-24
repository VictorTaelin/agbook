module Base.String.uncons where

open import Base.Char.Type
open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.String.Type

primitive
  primStringUncons : String -> Maybe (Σ Char (λ _ -> String))

-- Deconstructs a string into its first character and the rest.
-- - s: The input string.
-- = Just (first character, rest of the string) if the string is non-empty,
--   Nothing if the string is empty.
uncons : String -> Maybe (Σ Char (λ _ -> String))
uncons = primStringUncons
