module ARC.DSL.Functions.both where

open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions

-- Performs logical AND operation on two Boolean values.
-- - a: The 1st Boolean value.
-- - b: The 2nd Boolean value.
-- = True if both a and b are true, False otherwise.
both : Boolean → Boolean → Boolean
both = and
