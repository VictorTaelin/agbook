module Base.Bool.eq where

open import Base.Bool.Bool

eq : Bool → Bool → Bool
eq True  True  = True
eq False False = True
eq _     _     = False

infix 4 _==_
_==_ : Bool → Bool → Bool
_==_ = eq

{-# COMPILE JS eq = function(x) { return function(y) { return x ≡ y; }; } #-}
