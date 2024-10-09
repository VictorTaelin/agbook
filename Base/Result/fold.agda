module Base.Result.fold where

open import Base.Result.Result

-- Folds over a Result value.
-- - 1st: The function to apply to the value if the Result is Done.
-- - 2nd: The function to apply to the error if the Result is Fail.
-- - 3rd: The Result value to fold over.
-- = Either the result of applying 'done' to the value (if Done) or
--   the result of applying 'fail' to the error (if Fail).
fold : ∀ {A B E : Set} → (A → B) → (E → B) → Result A E → B
fold done fail (Done x) = done x
fold done fail (Fail e) = fail e
