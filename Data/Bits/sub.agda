module Data.Bits.sub where

open import Data.Bits.Type
open import Data.Bits.gt
open import Data.Bool.Type
open import Data.Bool.if

-- Performs subtraction with borrow of two Bits values.
-- If b > a, returns O E (zero).
-- Otherwise, performs the subtraction.
-- Note: The rightmost bit is the most significant one.
-- - a: The first Bits value (minuend).
-- - b: The second Bits value (subtrahend).
-- = A new Bits value representing the difference of a and b, or O E if b > a.
sub : Bits → Bits → Bits
sub a b = if b > a
          then O E
          else sub' a b False
  where
    -- Helper function for subtraction with borrow
    -- - a: The first Bits value (minuend).
    -- - b: The second Bits value (subtrahend).
    -- - borrow: Boolean indicating if there's a borrow from the previous operation.
    -- = The result of the subtraction.
    sub' : Bits → Bits → Bool → Bits
    sub' E        E        _     = E
    sub' E        (O _)    _     = O E  -- This case should not occur due to the initial check
    sub' E        (I _)    _     = O E  -- This case should not occur due to the initial check
    sub' (O a)    E        False = O a
    sub' (O a)    E        True  = I (sub' a E True)
    sub' (I a)    E        _     = I a
    sub' (O a)    (O b)    False = O (sub' a b False)
    sub' (O a)    (O b)    True  = I (sub' a b True)
    sub' (O a)    (I b)    borrow = I (sub' a b True)
    sub' (I a)    (O b)    False = I (sub' a b False)
    sub' (I a)    (O b)    True  = O (sub' a b False)
    sub' (I a)    (I b)    borrow = O (sub' a b borrow)

-- Infix operator for Bits subtraction
_-_ : Bits → Bits → Bits
_-_ = sub

infixl 6 _-_
