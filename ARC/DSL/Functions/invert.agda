module ARC.DSL.Functions.invert where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Integer.Functions
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair

-- Inverts a Numerical value
-- - n: The Numerical value to invert
-- = The inverted Numerical value
invert : Numerical → Numerical
invert (lft x)         = lft (neg x)
invert (rgt (x0 , x1)) = rgt (neg x0 , neg x1)
