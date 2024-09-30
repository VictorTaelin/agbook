module Base.Bool.xor where


open import Base.Bool.Bool

-- Performs logical XOR operation on two bools.
-- - a: The 1st bool.
-- - b: The 2nd bool.
-- = True if a and b are different.
xor : Bool → Bool → Bool
xor True  True  = False
xor True  False = True
xor False True  = True
xor False False = False

_^_ : Bool → Bool → Bool
_^_ = xor

infixr 7 _^_
