module ARC.DSL.Functions.halve where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.Type

-- Halves a Numerical value
-- - n: The Numerical value to be halved
-- = n / 2
halve : Numerical -> Numerical
halve (lft x)       = lft (I.div x 2)
halve (rgt (x , y)) = rgt (I.div x 2 , I.div y 2)
