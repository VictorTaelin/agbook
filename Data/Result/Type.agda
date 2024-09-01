module Data.Result.Type where

-- Represents a computation that may succeed with a value or fail with an error.
-- - A: The type of the successful result.
-- - E: The type of the error.
data Result (A : Set) (E : Set) : Set where
  Done : A → Result A E
  Fail : E → Result A E
