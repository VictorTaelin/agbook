module Data.Result.done-or where

open import Data.Result.Type

-- Unwraps the done value or returns a default value.
-- - result: The Result value to unwrap.
-- - default: The default value to return if the Result is a failure.
-- = The unwrapped value if the Result is successful, or the default value if it's a failure.
done-or : ∀ {A E : Set} → Result A E → A → A
done-or (Done x) _ = x
done-or (Fail _) default = default
