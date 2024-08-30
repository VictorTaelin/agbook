module Data.Bool.or where

open import Data.Bool.Main

-- Performs logical OR operation on two bools.
-- - a: The 1st bool.
-- - b: The 2nd bool.
-- = True if either a or b is true.
or : Bool → Bool → Bool
or true  _ = true
or false b = b
