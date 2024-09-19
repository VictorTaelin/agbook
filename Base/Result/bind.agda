module Base.Result.bind where

open import Base.Result.Type

-- Applies a function to the value inside a Result, if it's successful.
-- - ra: The Result value to operate on.
-- - fn: The function to apply to the value inside the Result if it's successful.
-- = A new Result value resulting from applying fn to the contents of ra if successful,
--   or the original error if ra is a failure.
bind : ∀ {A B E : Set} → Result A E → (A → Result B E) → Result B E
bind (Done x) fn = fn x
bind (Fail e) fn = Fail e

-- Infix operator for bind
_>>=_ : ∀ {A B E : Set} → Result A E → (A → Result B E) → Result B E
_>>=_ = bind

infixl 1 _>>=_
