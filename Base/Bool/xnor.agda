module Base.Bool.xnor where

open import Base.Bool.Bool

-- Performs logical XNOR operation on two bools.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if 1st and 2nd are the same, False otherwise.
xnor : Bool → Bool → Bool
xnor True  True  = True
xnor True  False = False
xnor False True  = False
xnor False False = True

