module Data.Bool.and where

open import Data.Bool.Main

-- Performs logical AND operation on two boolean values.
-- - a: The first boolean value.
-- - b: The second boolean value.
-- = True if both a and b are true.
and : Bool → Bool → Bool
and true  b = b
and false b = false
