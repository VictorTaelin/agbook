module ARC.DSL.Functions.multiply where

open import ARC.DSL.Types.Numerical.Type
open import ARC.DSL.Types.Integer.Type
open import ARC.DSL.Types.Union.Type
open import ARC.DSL.Types.Pair.Type
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.Type

-- Multiplication operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = a * b
multiply : Numerical -> Numerical -> Numerical
multiply (lft x)         (lft y)         = lft (I.mul x y)
multiply (lft x)         (rgt (y0 , y1)) = rgt (I.mul x y0  , I.mul x y1)
multiply (rgt (x0 , x1)) (lft y)         = rgt (I.mul x0 y  , I.mul x1 y)
multiply (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.mul x0 y0 , I.mul x1 y1)
