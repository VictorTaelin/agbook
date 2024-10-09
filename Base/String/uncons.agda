module Base.String.uncons where

open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Pair.Pair
open import Base.String.String

primitive
  primStringUncons : String → Maybe (Σ Char (λ _ → String))

-- Deconstructs a string into its first character and the rest.
-- - 1st: The input string.
-- = Just (first character, rest of the string) if the string is non-empty,
--   Nothing if the string is empty.
uncons : String → Maybe (Σ Char (λ _ → String))
uncons = primStringUncons

