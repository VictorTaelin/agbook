module ARC.DSL.Functions.double where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Types.Integer.Integer
import ARC.DSL.Types.Integer.Functions as I

-- Doubles a Numerical value
-- - x: The Numerical value to double
-- = 2 * x
double : Numerical → Numerical
double (Lft n)       = Lft (I.mul 2 n)
double (Rgt (n , m)) = Rgt (I.mul 2 n , I.mul 2 m)

