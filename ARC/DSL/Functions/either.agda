module ARC.DSL.Functions.either where

open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions

-- Performs logical OR operation on two Boolean values.
-- - a: The 1st Boolean value.
-- - b: The 2nd Boolean value.
-- = True if either a or b are true, False otherwise.
either : Boolean → Boolean → Boolean
either = or
