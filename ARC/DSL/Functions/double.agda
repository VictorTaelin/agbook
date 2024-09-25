module ARC.DSL.Functions.double where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type
open import ARC.DSL.Types.Integer.Type
import ARC.DSL.Types.Integer.Functions as I

-- Doubles a Numerical value
-- - x: The Numerical value to double
-- = 2 * x
double : Numerical → Numerical
double (lft n)       = lft (I.mul 2 n)
double (rgt (n , m)) = rgt (I.mul 2 n , I.mul 2 m)
