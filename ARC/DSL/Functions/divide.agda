module ARC.DSL.Functions.divide where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.Type

-- Division operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a / b
divide : Numerical -> Numerical -> Numerical
divide (lft x)         (lft y)         = lft (I.div x y)
divide (lft x)         (rgt (y0 , y1)) = rgt (I.div x y0  , I.div x y1)
divide (rgt (x0 , x1)) (lft y)         = rgt (I.div x0 y  , I.div x1 y)
divide (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.div x0 y0 , I.div x1 y1)
