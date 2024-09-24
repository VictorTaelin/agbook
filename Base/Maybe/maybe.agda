module Base.Maybe.maybe where

open import Base.Maybe.Type

-- Applies a function to the value inside a Maybe if it exists, otherwise returns a default value.
-- - default: The value to return if the Maybe is None.
-- - fn: The function to apply to the value inside the Maybe if it exists.
-- - ma: The Maybe value to operate on.
-- = Either the default value (if ma is None) or the result of applying fn to the value inside ma.
maybe : ∀ {A B : Set} -> B -> (A -> B) -> Maybe A -> B
maybe default fn None     = default
maybe default fn (Some x) = fn x
