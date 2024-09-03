module Data.Bits.gt where

open import Data.Bits.Type
open import Data.Bool.Type

-- Performs greater than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is greater than b, False otherwise.
gt : Bits → Bits → Bool
gt E        E        = False
gt E        (O _)    = False
gt E        (I _)    = False
gt (O _)    E        = True
gt (I _)    E        = True
gt (O a)    (O b)    = gt a b
gt (O a)    (I _)    = False
gt (I a)    (O b)    = True
gt (I a)    (I b)    = gt a b

-- Infix operator for bitwise greater than comparison
_>_ : Bits → Bits → Bool
_>_ = gt

infix 4 _>_
