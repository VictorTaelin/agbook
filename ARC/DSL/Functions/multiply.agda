module ARC.DSL.Functions.multiply where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.IntegerPair

-- Multiplication operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a * b
multiply : Numerical -> Numerical -> Numerical
multiply (lft x)         (lft y)         = lft (I.mul x y)
multiply (lft x)         (rgt (y0 , y1)) = rgt (I.mul x y0  , I.mul x y1)
multiply (rgt (x0 , x1)) (lft y)         = rgt (I.mul x0 y  , I.mul x1 y)
multiply (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.mul x0 y0 , I.mul x1 y1)
