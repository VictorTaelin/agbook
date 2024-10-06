module Base.Bool.nor where

open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Bool.not

-- Performs logical NOR operation on two boolean values.
-- 1st: The boolean value.
-- 2nd: The boolean value.
-- = True if both inputs are False, False otherwise.
nor : Bool → Bool → Bool
nor a b = not (a || b)

