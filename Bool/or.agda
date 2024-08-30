module Bool.or where

open import Bool.Main

-- Performs logical OR operation on two bools.
-- - a: the 1st bool.
-- - b: the 2ns bool.
-- = True if either a or b is true.
or : Bool → Bool → Bool
or true  _ = true
or false b = b
