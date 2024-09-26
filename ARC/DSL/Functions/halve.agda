module ARC.DSL.Functions.halve where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.IntegerPair

-- Halves a Numerical value
-- - n: The Numerical value to be halved
-- = n / 2
halve : Numerical -> Numerical
halve (lft x)       = lft (I.div x 2)
halve (rgt (x , y)) = rgt (I.div x 2 , I.div y 2)
