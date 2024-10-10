module Base.Result.Result where

-- Represents a computation that may succeed with a value or fail with an error.
-- - 1st: The type of the successful result.
-- - 2nd: The type of the error.
-- = A value that either contains the successful result or the error.
data Result (A : Set) (E : Set) : Set where
  Done : A → Result A E
  Fail : E → Result A E

