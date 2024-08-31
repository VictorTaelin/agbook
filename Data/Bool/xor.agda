module Data.Bool.xor where

open import Data.Bool.Type

-- Performs logical XOR operation on two bools.
-- - a: The 1st bool.
-- - b: The 2nd bool.
-- = True if a and b are different.
xor : Bool → Bool → Bool
xor True  True  = False
xor True  False = True
xor False True  = True
xor False False = False
