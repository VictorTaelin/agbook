module Bool.xor where

open import Bool.Main

-- Performs logical XOR operation on two boolean values
-- - a: the first boolean value
-- - b: the second boolean value
-- = true if a and b are different, false if they are the same
xor : Bool → Bool → Bool
xor true  true  = false
xor true  false = true
xor false true  = true
xor false false = false
