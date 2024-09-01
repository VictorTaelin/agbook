module Data.String.eq where

open import Data.String.Type
open import Data.Bool.Type

primitive
  primStringEquality : String → String → Bool

-- Checks if two strings are equal.
-- - s1: The 1st string.
-- - s2: The 2nd string.
-- = True if s1 and s2 are equal.
_==_ : String → String → Bool
s1 == s2 = primStringEquality s1 s2
