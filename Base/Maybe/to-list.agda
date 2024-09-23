module Base.Maybe.to-list where

open import Base.Maybe.Type
open import Base.List.Type

-- Converts a Maybe value to a List.
-- - ma: The Maybe value to convert.
-- = An empty list if the input is None, or a singleton list containing the value if it's Some.
to-list : ∀ {A : Set} → Maybe A → List A
to-list None     = []
to-list (Some x) = x :: []
