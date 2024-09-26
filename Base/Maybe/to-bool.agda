module Base.Maybe.to-bool where

open import Base.Maybe.Maybe
open import Base.Bool.Bool

-- Converts a Maybe value to a Bool.
-- - ma: The Maybe value to convert.
-- = True if the input is Some, False if it's None.
to-bool : ∀ {A : Set} -> Maybe A -> Bool
to-bool (Some _) = True
to-bool None     = False
