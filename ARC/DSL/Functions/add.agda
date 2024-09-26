module ARC.DSL.Functions.add where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
import ARC.DSL.Types.Integer.Functions as I
open import ARC.DSL.Types.IntegerPair.IntegerPair

-- Addition operation for Numerical types
-- - a: The first Numerical value
-- - b: The second Numerical value
-- = The sum of a and b
add : Numerical -> Numerical -> Numerical
add (lft x)         (lft y)         = lft (I.add x y)
add (lft x)         (rgt (y0 , y1)) = rgt (I.add x y0  , I.add x y1)
add (rgt (x0 , x1)) (lft y)         = rgt (I.add x0 y  , I.add x1 y)
add (rgt (x0 , x1)) (rgt (y0 , y1)) = rgt (I.add x0 y0 , I.add x1 y1)
