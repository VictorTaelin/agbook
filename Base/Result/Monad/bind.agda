module Base.Result.Monad.bind where

open import Base.Result.Result

-- Applies a function to the value inside a Result, if it's successful.
-- - 1st: The Result value to operate on.
-- - 2nd: The function to apply to the value inside the Result if it's successful.
-- = A new Result value resulting from applying 2nd to the contents of 1st if successful,
--   or the original error if 1st is a failure.
bind : ∀ {A B E : Set} → Result A E → (A → Result B E) → Result B E
bind (Done x) fn = fn x
bind (Fail e) fn = Fail e

-- Infix operator for bind
_>>=_ : ∀ {A B E : Set} → Result A E → (A → Result B E) → Result B E
_>>=_ = bind

infixl 1 _>>=_