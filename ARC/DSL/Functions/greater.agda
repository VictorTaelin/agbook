module ARC.DSL.Functions.greater where

open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Boolean.Type
import ARC.DSL.Types.Integer.Functions as I

-- Compares two integers and returns True if the first is greater than the second.
-- - a: The first integer to compare.
-- - b: The second integer to compare.
-- = True if a is greater than b, False otherwise.
greater : Integer → Integer → Boolean
greater = I._>_
