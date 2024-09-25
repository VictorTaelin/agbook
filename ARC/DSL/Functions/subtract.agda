module ARC.DSL.Functions.subtract where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.Type

-- Subtraction operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a - b
subtract : Numerical -> Numerical -> Numerical
subtract (lft x)         (lft y)         = lft (I.sub x y)
subtract (lft x)         (rgt (y0 , y1)) = rgt (I.sub x y0  , I.sub x y1)
subtract (rgt (x0 , x1)) (lft y)         = rgt (I.sub x0 y  , I.sub x1 y)
subtract (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.sub x0 y0 , I.sub x1 y1)
