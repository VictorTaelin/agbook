module Base.Maybe.run where

open import Base.Maybe.Maybe

-- Runs a Maybe monad, returning a default value if it is None.
-- - d: The default value to return if ma is None.
-- - m: The Maybe value to run.
-- = The value inside ma if it's Some, otherwise the default value.
run : ∀ {A : Set} -> A -> Maybe A -> A
run d None     = d
run _ (Some x) = x
