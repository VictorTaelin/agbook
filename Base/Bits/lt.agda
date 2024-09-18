module Base.Bits.lt where

open import Base.Bits.Type
open import Base.Bool.Type

-- Performs less than comparison on two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = True if a is less than b, False otherwise.
lt : Bits → Bits → Bool
lt E     E     = False
lt E     (O _) = True
lt E     (I _) = True
lt (O _) E     = False
lt (I _) E     = False
lt (O a) (O b) = lt a b
lt (O a) (I _) = True
lt (I a) (O _) = False
lt (I a) (I b) = lt a b

-- Infix operator for bitwise less than comparison
_<_ : Bits → Bits → Bool
_<_ = lt

infix 4 _<_
