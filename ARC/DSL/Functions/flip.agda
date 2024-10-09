module ARC.DSL.Functions.flip where

open import ARC.DSL.Types.Boolean.Boolean
open import ARC.DSL.Types.Boolean.Functions

-- Flips a Boolean value
-- - x: The input Boolean value
-- = The opposite Boolean value (True becomes False, False becomes True)
flip : Boolean → Boolean
flip x = not x

