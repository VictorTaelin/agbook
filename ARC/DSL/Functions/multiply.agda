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
multiply : Numerical → Numerical → Numerical
multiply (Lft x)         (Lft y)         = Lft (I.mul x y)
multiply (Lft x)         (Rgt (y0 , y1)) = Rgt (I.mul x y0  , I.mul x y1)
multiply (Rgt (x0 , x1)) (Lft y)         = Rgt (I.mul x0 y  , I.mul x1 y)
multiply (Rgt (x0 , x1)) (Rgt (y0 , y1)) = Rgt (I.mul x0 y0 , I.mul x1 y1)
