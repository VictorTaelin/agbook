module Bool.xor where

open import Bool.Main

-- Performs logical XOR operation on two bools.
-- - a: the 1st bool.
-- - b: the 2nd bool.
-- = True if a and b are different.
xor : Bool → Bool → Bool
xor true  true  = false
xor true  false = true
xor false true  = true
xor false false = false
