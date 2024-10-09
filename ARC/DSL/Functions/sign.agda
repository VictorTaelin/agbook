module ARC.DSL.Functions.sign where

open import ARC.DSL.Types.Numerical.Numerical
open import ARC.DSL.Types.Integer.Integer
open import ARC.DSL.Types.Integer.Functions
open import ARC.DSL.Types.IntegerPair.IntegerPair
open import ARC.DSL.Types.Union.Union
open import ARC.DSL.Types.Pair.Pair
open import ARC.DSL.Functions.equality
open import ARC.DSL.Functions.greater

open import Base.Ordering.Ordering

int-sign : Integer → Integer
int-sign x with compare x 0
... | LT = 0 - 1
... | EQ = 0
... | GT = 1

-- Computes the sign of a Numerical value.
-- For integers: returns 0 if x is 0, 1 if x > 0, and -1 if x < 0.
-- For integer pairs: applies the same logic to each component.
-- - x: The Numerical value to compute the sign for.
-- = A Numerical value representing the sign of x.
sign : Numerical → Numerical
sign (Lft x)         = Lft (int-sign x)
sign (Rgt (x0 , x1)) = Rgt (int-sign x0 , int-sign x1)

