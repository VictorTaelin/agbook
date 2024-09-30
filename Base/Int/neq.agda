module Base.Int.neq where

open import Base.Int.Int
open import Base.Int.eq
open import Base.Bool.Bool
open import Base.Bool.not

-- Checks if two integers are not equal.
-- - x: The 1st integer.
-- - y: The 2nd integer.
-- = True if x and y are not equal, False otherwise.
neq : Int → Int → Bool
neq x y = not (x == y)

infix 4 _!=_
_!=_ : Int → Int → Bool
_!=_ = neq
