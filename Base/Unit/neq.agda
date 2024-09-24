module Base.Unit.neq where

open import Base.Bool.Type
open import Base.Unit.Type

-- Inequality check for Unit type.
-- - x: The 1st Unit value.
-- - y: The 2nd Unit value.
-- = False, as all Unit values are equal.
neq : Unit -> Unit -> Bool
neq _ _ = False

-- The infix version of neq.
_!=_ : Unit -> Unit -> Bool
_!=_ = neq

infix 4 _!=_

