module Base.Float.Comparison where

open import Base.Float.Type
open import Base.Bool.Type
open import Base.Bool.not

infix 4 _f<_ _f>_ _f<=_ _f>=_ _f==_ _f!=_

-- Less than comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is less than b, false otherwise.
_f<_ : Float → Float → Bool
_f<_ = primFloatLess

-- Greater than comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is greater than b, false otherwise.
_f>_ : Float → Float → Bool
a f> b = b f< a

-- Less than or equal to comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is less than or equal to b, false otherwise.
_f<=_ : Float → Float → Bool
a f<= b = not (b f< a)

-- Greater than or equal to comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is greater than or equal to b, false otherwise.
_f>=_ : Float → Float → Bool
a f>= b = not (a f< b)

-- Equality comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is equal to b, false otherwise.
_f==_ : Float → Float → Bool
_f==_ = primFloatEquality

-- Not equal comparison for floats.
-- - a: The first float.
-- - b: The second float.
-- = True if a is not equal to b, false otherwise.
_f!=_ : Float → Float → Bool
a f!= b = not (a f== b)
