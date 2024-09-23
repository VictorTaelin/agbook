module Base.Int.from-neg where

open import Base.Int.Type
open import Base.Nat.Type

-- Converts a negative natural number to an integer.
-- - n: The natural number to convert.
-- = The corresponding negative integer representation.
--   Note: Zero is treated as a positive number (Pos Zero).
from-neg : Nat → Int
from-neg Zero     = Pos Zero
from-neg (Succ n) = NegSuc n

{-# BUILTIN FROMNEG from-neg #-}
