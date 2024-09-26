module Base.Unit.eq where

open import Base.Bool.Bool
open import Base.Unit.Unit

-- Equality check for Unit type.
-- - x: The 1st Unit value.
-- - y: The 2nd Unit value.
-- = True, as all Unit values are equal.
eq : Unit -> Unit -> Bool
eq _ _ = True

-- The infix version of eq.
_==_ : Unit -> Unit -> Bool
_==_ = eq

infix 4 _==_

