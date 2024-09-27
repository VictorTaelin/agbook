module ARC.DSL.Functions.increment where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Functions.add

-- Increments a Numerical value by 1
-- - x: The Numerical value to increment
-- = The incremented Numerical value
increment : Numerical → Numerical
increment x = add x (Lft 1)
