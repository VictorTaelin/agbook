module Data.Bits.lt where

open import Data.Bits.Type
open import Data.Bool.Type

-- Performs less than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is less than b, False otherwise.
lt : Bits → Bits → Bool
lt E        E        = False
lt E        (O _)    = False
lt E        (I _)    = False
lt (O _)    E        = True
lt (I _)    E        = True
lt (O a)    (O b)    = lt a b
lt (O a)    (I _)    = False
lt (I a)    (O b)    = True
lt (I a)    (I b)    = lt a b

-- Infix operator for bitwise less than comparison
_<_ : Bits → Bits → Bool
_<_ = lt

infix 4 _<_
