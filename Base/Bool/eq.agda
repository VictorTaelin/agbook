module Base.Bool.eq where

open import Base.Bool.Bool

-- Checks if two boolean values are equal.
-- - 1st: The first boolean value.
-- - 2nd: The second boolean value.
-- = True if both values are the same, False otherwise.
eq : Bool -> Bool -> Bool
eq True  True  = True
eq False False = True
eq _     _     = False

-- Defines the infix operator _==_ for boolean equality.
_==_ : Bool -> Bool -> Bool
_==_ = eq

infix 4 _==_

{-# COMPILE JS eq = function(x) { return function(y) { return x ≡ y; }; } #-}
