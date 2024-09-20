module Base.Bool.eq where

open import Base.Bool.Type

eq : Bool → Bool → Bool
eq True  True  = True
eq False False = True
eq _     _     = False

{-# COMPILE JS eq = function(x) { return function(y) { return x === y; }; } #-}
