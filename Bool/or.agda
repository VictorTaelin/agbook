module Bool.or where

open import Bool.Main

-- Performs logical OR operation on two boolean values
-- - a: the first boolean value
-- - b: the second boolean value
-- = true if either a or b is true, false otherwise
or : Bool → Bool → Bool
or true  _ = true
or false b = b
