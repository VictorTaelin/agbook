module ARC.DSL.Functions.even where

open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Integer.Functions

-- Checks if a Numerical value is even
-- - n: The Numerical value to check
-- = True if n is even, False otherwise
even : Integer → Boolean
even x = eq (x % 2) 0
