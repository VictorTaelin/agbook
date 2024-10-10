module Base.Bool.neq where

open import Base.Bool.Bool

-- Performs logical NOT EQUAL operation on two boolean values.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if 1st and 2nd are different, False otherwise.
neq : Bool → Bool → Bool
neq True  False = True
neq False True  = True
neq _     _     = False

-- Infix operator for not equal comparison.
_!=_ : Bool → Bool → Bool
_!=_ = neq

infix 4 _!=_

{-# COMPILE JS neq = function(x) { return function(y) { return x !== y; }; } #-}

