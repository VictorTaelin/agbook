module ARC.DSL.Functions.positive where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Functions.greater

-- Checks if an integer is positive.
-- - x: The integer to check.
-- = True if x is greater than 0, False otherwise.
positive : Integer → Boolean
positive x = greater x 0

