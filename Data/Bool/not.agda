module Data.Bool.not where

open import Data.Bool.Type

-- Negates a Boolean value.
-- - b: The input Boolean value.
-- = The negation of the input.
not : Bool → Bool
not True  = False
not False = True
