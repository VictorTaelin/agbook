module ARC.DSL.Functions.subtract where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.IntegerPair

-- Subtraction operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a - b
subtract : Numerical -> Numerical -> Numerical
subtract (Lft x)         (Lft y)         = Lft (I.sub x y)
subtract (Lft x)         (Rgt (y0 , y1)) = Rgt (I.sub x y0  , I.sub x y1)
subtract (Rgt (x0 , x1)) (Lft y)         = Rgt (I.sub x0 y  , I.sub x1 y)
subtract (Rgt (x0 , x1)) (Rgt (y0 , y1)) = Rgt (I.sub x0 y0 , I.sub x1 y1)
