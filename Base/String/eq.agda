module Base.String.eq where

open import Base.String.Type
open import Base.Bool.Type

primitive
  primStringEquality : String -> String -> Bool

-- Checks if two strings are equal.
-- - 1st: The first string to compare.
-- - 2nd: The second string to compare.
-- = A boolean value indicating whether the strings are equal.
eq : String -> String -> Bool
eq = primStringEquality

-- Infix operator for string equality.
_==_ : String -> String -> Bool
_==_ = eq

infix 4 _==_

