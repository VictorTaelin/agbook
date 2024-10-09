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
add : Numerical → Numerical → Numerical
add (Lft x)         (Lft y)         = Lft (I.add x y)
add (Lft x)         (Rgt (y0 , y1)) = Rgt (I.add x y0  , I.add x y1)
add (Rgt (x0 , x1)) (Lft y)         = Rgt (I.add x0 y  , I.add x1 y)
add (Rgt (x0 , x1)) (Rgt (y0 , y1)) = Rgt (I.add x0 y0 , I.add x1 y1)

