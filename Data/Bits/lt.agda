module Data.Bits.lt where

open import Data.Bits.Type
open import Data.Bool.Type

-- Performs less than comparison on two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = True if a is less than b, False otherwise.
lt : Bits → Bits → Bool
lt E        E        = False
lt E        (O _)    = True
lt E        (I _)    = True
lt (O _)    E        = False
lt (I _)    E        = False
lt (O a)    (O b)    = lt a b
lt (O a)    (I _)    = True
lt (I a)    (O b)    = False
lt (I a)    (I b)    = lt a b

-- Infix operator for bitwise less than comparison
_<_ : Bits → Bits → Bool
_<_ = lt

infix 4 _<_
