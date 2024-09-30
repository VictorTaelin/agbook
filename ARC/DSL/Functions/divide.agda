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
divide : Numerical → Numerical → Numerical
divide (Lft x)         (Lft y)         = Lft (I.div x y)
divide (Lft x)         (Rgt (y0 , y1)) = Rgt (I.div x y0  , I.div x y1)
divide (Rgt (x0 , x1)) (Lft y)         = Rgt (I.div x0 y  , I.div x1 y)
divide (Rgt (x0 , x1)) (Rgt (y0 , y1)) = Rgt (I.div x0 y0 , I.div x1 y1)
