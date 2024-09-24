module Base.F64.add where

open import Base.F64.Type

primitive primFloatPlus : F64 -> F64 -> F64

-- Addition of floats.
-- - x: The 1st float.
-- - y: The 2nd float.
-- = The sum of x and y.
add : F64 -> F64 -> F64
add = primFloatPlus

-- The infix version of add.
infixl 6 _+_
_+_ : F64 -> F64 -> F64
_+_ = add
