module Data.Bit.eq where

open import Data.Bit.Type

eq : Bit → Bit → Bit
eq True  True  = True
eq False False = True
eq _     _     = False

-- | Infix equality operator for Bit
infix 4 _==_
_==_ : Bit → Bit → Bit
_==_ = eq
