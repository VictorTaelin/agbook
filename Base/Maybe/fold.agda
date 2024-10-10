module Base.Maybe.fold where

open import Base.Maybe.Maybe

-- Folds over a Maybe value.
-- - default: The value to return if the Maybe is None.
-- - fn: The function to apply to the value if the Maybe is Some.
-- - ma: The Maybe value to fold over.
-- = Either the default value (if None) or the result of applying fn to the value (if Some).
fold : ∀ {A B : Set} → B → (A → B) → Maybe A → B
fold default fn None     = default
fold default fn (Some x) = fn x

