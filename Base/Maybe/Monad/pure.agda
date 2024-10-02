module Base.Maybe.Monad.pure where

open import Base.Maybe.Maybe

-- Wraps a value in a Maybe context.
-- - x: The value to be wrapped.
-- = A Maybe value containing x.
pure : ∀ {A : Set} → A → Maybe A
pure x = Some x
