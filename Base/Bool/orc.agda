module Base.Bool.orc where

open import Base.Bool.Bool

-- Performs logical OR with complement 1st | ~2nd.
-- 1st: The boolean value.
-- 2nd: The boolean value.
-- = True if either 1st or 2nd (or both) are true.
orc : Bool → Bool → Bool
orc False True = False
orc a     b    = True

