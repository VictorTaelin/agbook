module ARC.DSL.Functions.divide where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.IntegerPair

-- Division operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a / b
divide : Numerical -> Numerical -> Numerical
divide (lft x)         (lft y)         = lft (I.div x y)
divide (lft x)         (rgt (y0 , y1)) = rgt (I.div x y0  , I.div x y1)
divide (rgt (x0 , x1)) (lft y)         = rgt (I.div x0 y  , I.div x1 y)
divide (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.div x0 y0 , I.div x1 y1)
