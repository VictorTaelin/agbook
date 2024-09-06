module Data.Bits.append where

open import Data.Bits.Type

-- Appends two Bits values.
-- - as: The first Bits value.
-- - bs: The second Bits value.
-- = A new Bits value representing the concatenation of as and bs.
append : Bits → Bits → Bits
append E bs = bs
append (O as) bs = O (append as bs)
append (I as) bs = I (append as bs)

-- Infix operator for Bits appending
_++_ : Bits → Bits → Bits
_++_ = append

infixr 5 _++_
