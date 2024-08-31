module Data.Bool.xor where

open import Data.Bool.Type

-- Performs logical XOR operation on two bools.
-- - a: The 1st bool.
-- - b: The 2nd bool.
-- = True if a and b are different.
xor : Bool → Bool → Bool
xor true  true  = false
xor true  false = true
xor false true  = true
xor false false = false
