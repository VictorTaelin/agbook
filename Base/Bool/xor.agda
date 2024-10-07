module Base.Bool.xor where


open import Base.Bool.Bool

-- Performs logical XOR operation on two bools.
-- - 1st: The boolean value.
-- - 2nd: The boolean value.
-- = True if 1st and 2nd are different.
xor : Bool → Bool → Bool
xor True  True  = False
xor True  False = True
xor False True  = True
xor False False = False

-- Infix operator for xor bitwise operator.
_^_ : Bool → Bool → Bool
_^_ = xor

infixr 7 _^_

