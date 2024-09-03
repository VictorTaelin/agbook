module Data.Bits.eq where

open import Data.Bits.Type
open import Data.Bool.Type

-- Checks if two Bits are equal.
-- - b1: The first Bits value.
-- - b2: The second Bits value.
-- = True if b1 and b2 are equal, False otherwise.
eq : Bits → Bits → Bool
eq E E = True
eq (O a) (O b) = eq a b
eq (I a) (I b) = eq a b
eq _ _ = False

-- Infix operator for Bits equality
_==_ : Bits → Bits → Bool
_==_ = eq

infix 4 _==_
