module ARC.DSL.Functions.invert where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Integer.Functions
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type

-- Inverts a Numerical value
-- - n: The Numerical value to invert
-- = The inverted Numerical value
invert : Numerical → Numerical
invert (lft x)         = lft (neg x)
invert (rgt (x0 , x1)) = rgt (neg x0 , neg x1)
