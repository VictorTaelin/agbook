module Base.Bool.nand where

open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.not

-- Performs logical NAND operation on two boolean values.
-- - 1st: The first boolean value.
-- - 2nd: The second boolean value.
-- = True if at least one of the inputs is False, False if both inputs are True.
nand : Bool → Bool → Bool
nand a b = not (a && b)

