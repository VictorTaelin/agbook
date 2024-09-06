module Data.Bool.eq where

open import Data.Bool.Type

eq : Bool → Bool → Bool
eq True  True  = True
eq False False = True
eq _     _     = False

-- | Infix equality operator for Bool
infix 4 _==_
_==_ : Bool → Bool → Bool
_==_ = eq
