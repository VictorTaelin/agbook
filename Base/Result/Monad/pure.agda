module Base.Result.Monad.pure where

open import Base.Result.Result

-- Lifts a value into a successful Result.
-- - x: The value to be wrapped in a Result.
-- = A Result containing the input value as a successful outcome.
pure : ∀ {A E : Set} → A → Result A E
pure x = Done x
