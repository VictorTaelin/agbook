module Data.Bit.and where

open import Data.Bit.Type

-- Performs logical AND operation on two boolean values.
-- - a: The first boolean value.
-- - b: The second boolean value.
-- = True if both a and b are true.
and : Bit → Bit → Bit
and True  b = b
and False b = False

_&&_ : Bit → Bit → Bit
_&&_ = and

infixr 6 _&&_
