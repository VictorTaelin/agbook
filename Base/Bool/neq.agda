module Base.Bool.neq where

open import Base.Bool.Type

neq : Bool → Bool → Bool
neq True  False = True
neq False True  = True
neq _     _     = False

{-# COMPILE JS neq = function(x) { return function(y) { return x !== y; }; } #-}
