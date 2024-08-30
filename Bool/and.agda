module Bool.and where

open import Bool.Main

-- Performs logical AND operation on two boolean values.
-- - a: the first boolean value.
-- - b: the second boolean value.
-- = True if both a and b are true.
and : Bool → Bool → Bool
and true  b = b
and false b = false
